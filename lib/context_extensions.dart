import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/auth_bloc.dart';
import 'package:gym_app/data/models/offline_user_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'get_it_dependency_injection.dart';
import 'offline_user_data_singleton.dart';

extension BuildContextExtensions on BuildContext {
  User get currentUser {
    final authState = read<AuthBloc>().state;
    if (authState is! Authenticated) {
      throw StateError('No authenticated user found');
    }
    return authState.user;
  }

  String? get currentUserId {
    return getIt.get<OfflineUserDataSingleton>().userData?.userId;
  }

  OfflineUserData? get currentOfflineUser {
    return getIt.get<OfflineUserDataSingleton>().userData;
  }

  bool get isAuthenticated {
    return read<AuthBloc>().state is Authenticated;
  }
}
