import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/auth_bloc.dart';
import 'package:gym_app/network_connectivity_notifier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension BuildContextExtensions on BuildContext {
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

  bool get isOnline {
    return read<NetworkConnectivityNotifier>().isOnline;
  }
}