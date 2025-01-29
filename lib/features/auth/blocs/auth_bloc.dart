import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

sealed class AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class AuthLoading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  Authenticated({required this.user});
  final User user;
}

class AuthEmailConfirmationRequired extends AuthenticationState {}

class AuthError extends AuthenticationState {
  AuthError({required this.error});
  final String error;
}

sealed class AuthEvent {}

class SignInRequested extends AuthEvent {
  SignInRequested({required this.email, required this.password});
  final String email;
  final String password;
}

class SignUpRequested extends AuthEvent {
  SignUpRequested({required this.email, required this.password});
  final String email;
  final String password;
}

class SignOutRequested extends AuthEvent {}

class _AuthStateChanged extends AuthEvent {
  _AuthStateChanged({required this.user});
  final User? user;
}

class _AuthStateErrorEvent extends AuthEvent {
  _AuthStateErrorEvent({required this.error});
  final String error;
}

class AuthBloc extends Bloc<AuthEvent, AuthenticationState> {
  AuthBloc({required this.supabaseClient}) : super(Unauthenticated()) {
    _handleAuthStateChanges();
    on<SignUpRequested>(_handleSignUp);
    on<SignInRequested>(_handleSignIn);
    on<SignOutRequested>(_handleSignOut);
    on<_AuthStateChanged>(_handleAuthStateChanged);
    on<_AuthStateErrorEvent>(_handleAuthError);
  }
  final GoTrueClient supabaseClient;
  StreamSubscription<AuthState>? _authStateSubscription;

  void _handleAuthStateChanges() {
    _authStateSubscription = supabaseClient.onAuthStateChange.listen(
      (data) {
        if (data.event == AuthChangeEvent.initialSession) {
          if (data.session != null) {
            add(_AuthStateChanged(user: data.session!.user));
          } else {
            add(_AuthStateChanged(user: null));
          }
        } else if (data.event == AuthChangeEvent.tokenRefreshed) {
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

  Future<void> _handleSignUp(
    SignUpRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final response = await supabaseClient.signUp(
        password: event.password,
        email: event.email,
      );
      if (response.user != null && response.session == null) {
        emit(AuthEmailConfirmationRequired());
      }
    } on AuthException catch (e) {
      emit(AuthError(error: e.message));
    }
  }

  Future<void> _handleSignIn(
    SignInRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthLoading());
    if (state is Authenticated) {
      return;
    }
    try {
      await supabaseClient.signInWithPassword(
        password: event.password,
        email: event.email,
      );
    } on AuthException catch (e) {
      emit(AuthError(error: e.message));
    }
  }

  Future<void> _handleSignOut(
    SignOutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
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

  void _handleAuthStateChanged(
    _AuthStateChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    if (event.user != null) {
      emit(Authenticated(user: event.user!));
    } else {
      emit(Unauthenticated());
    }
  }

  void _handleAuthError(
    _AuthStateErrorEvent event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(AuthError(error: event.error));
  }

  @override
  Future<void> close() async {
    await super.close();
    await _authStateSubscription?.cancel();
  }
}
