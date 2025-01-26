import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

sealed class AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class AuthLoading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;

  Authenticated({required this.user});
}

class AuthEmailConfirmationRequired extends AuthenticationState {}

class AuthError extends AuthenticationState {
  final String error;

  AuthError({required this.error});
}

sealed class AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;
  SignInRequested({required this.email, required this.password});
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;

  SignUpRequested({required this.email, required this.password});
}

class SignOutRequested extends AuthEvent {}

class _AuthStateChanged extends AuthEvent {
  final User? user;

  _AuthStateChanged({required this.user});
}

class _AuthStateErrorEvent extends AuthEvent {
  final String error;

  _AuthStateErrorEvent({required this.error});
}

class AuthBloc extends Bloc<AuthEvent, AuthenticationState> {
  final GoTrueClient supabaseClient;
  StreamSubscription<AuthState>? _authStateSubscription;

  AuthBloc({required this.supabaseClient}) : super(Unauthenticated()) {
    _handleAuthStateChanges();
    on<SignUpRequested>(_handleSignUp);
    on<SignInRequested>(_handleSignIn);
    on<SignOutRequested>(_handleSignOut);
    on<_AuthStateChanged>(_handleAuthStateChanged);
    on<_AuthStateErrorEvent>(_handleAuthError);
  }

  void _handleAuthStateChanges() {
    _authStateSubscription = supabaseClient.onAuthStateChange.listen(
      (data) {
        if (data.event == AuthChangeEvent.initialSession) {
          if (data.session != null) {
            add(_AuthStateChanged(user: data.session!.user));
          } else {
            add(_AuthStateChanged(user: null));
          }
        } else if (data.event == AuthChangeEvent.signedIn &&
            data.session != null) {
          add(_AuthStateChanged(user: data.session!.user));
        } else if (data.event == AuthChangeEvent.signedOut) {
          add(_AuthStateChanged(user: null));
        } else {
          add(_AuthStateErrorEvent(error: data.event.name));
        }
      },
      onError: (error) {
        add(_AuthStateErrorEvent(error: error.toString()));
      },
    );
  }

  _handleSignUp(
      SignUpRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoading());
    try {
      final response = await supabaseClient.signUp(
          password: event.password, email: event.email);
      if (response.user != null && response.session == null) {
        emit(AuthEmailConfirmationRequired());
      }
    } on AuthException catch (e) {
      emit(AuthError(error: e.message));
    }
  }

  _handleSignIn(
      SignInRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoading());
    if (state is Authenticated) {
      return;
    }
    try {
      await supabaseClient.signInWithPassword(
          password: event.password, email: event.email);
    } on AuthException catch (e) {
      emit(AuthError(error: e.message));
    }
  }

  _handleSignOut(
      SignOutRequested event, Emitter<AuthenticationState> emit) async {
    if (state is Unauthenticated) {
      return;
    }
    emit(AuthLoading());
    try {
      await supabaseClient.signOut();
    } on AuthException catch (e) {
      emit(AuthError(error: e.message));
    }
  }

  _handleAuthStateChanged(
      _AuthStateChanged event, Emitter<AuthenticationState> emit) {
    if (event.user != null) {
      emit(Authenticated(user: event.user!));
    } else {
      emit(Unauthenticated());
    }
  }

  _handleAuthError(
      _AuthStateErrorEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthError(error: event.error));
  }

  @override
  Future<void> close() async {
    super.close();
    _authStateSubscription?.cancel();
  }
}
