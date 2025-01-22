import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension AuthContext on BuildContext {
  User get currentUser {
    final authState = read<AuthBloc>().state;
    if (authState is! Authenticated) {
      throw StateError('No authenticated user found');
    }
    return authState.user;
  }

  String get currentUserId {
    return currentUser.id;
  }

  bool get isAuthenticated {
    return read<AuthBloc>().state is Authenticated;
  }
}

extension AuthBlocGetters on AuthBloc {
  User? get currentUser {
    final currentState = state;
    return (currentState is Authenticated) ? currentState.user : null;
  }

  String? get userId => currentUser?.id;

  bool get isAuthenticated => state is Authenticated;
}
