import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/auth_bloc.dart';
import 'package:gym_app/data/models/offline_user_data.dart';
import 'package:gym_app/unit_notifier.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../offline_user_data_singleton.dart';
import '../dependency_injection/get_it_dependency_injection.dart';

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

  String get units => read<UnitNotifier>().units;
  bool get isMetric => read<UnitNotifier>().isMetric;
}
