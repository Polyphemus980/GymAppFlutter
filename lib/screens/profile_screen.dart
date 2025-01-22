import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/auth_bloc.dart';
import 'package:gym_app/get_it_dependency_injection.dart';
import 'package:gym_app/offline_user_data_singleton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthBloc>().add(SignOutRequested());
          getIt.get<OfflineUserDataSingleton>().deleteUserIdFromStorage();
          context.go('/login');
        },
        child: const Text("Sign out"),
      ),
    );
  }
}
