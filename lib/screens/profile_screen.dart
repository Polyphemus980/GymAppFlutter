import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/auth_bloc.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: 'Profile',
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(spacing: 32, children: [
              AppInkWellButton(
                onTap: () {},
                text: "Profile",
              ),
              AppInkWellButton(
                onTap: () {
                  context.push('/exercise');
                },
                text: "Exercises",
              ),
              AppInkWellButton(onTap: () {}, text: "Calculator"),
              ElevatedButton(
                onPressed: () async {
                  context.read<AuthBloc>().add(SignOutRequested());
                  //await getIt
                  //    .get<OfflineUserDataSingleton>()
                  //    .deleteUserIdFromStorage();
                  context.go('/login');
                },
                child: const Text("Sign out"),
              ),
            ])));
  }
}
