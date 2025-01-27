import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/auth_bloc.dart';
import 'package:gym_app/context_extensions.dart';
import 'package:gym_app/get_it_dependency_injection.dart';
import 'package:gym_app/offline_user_data_singleton.dart';
import 'package:gym_app/theme_notifier.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:provider/provider.dart';

import '../unit_notifier.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Profile',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            spacing: 32,
            children: [
              ProfileHeader(
                avatar: const CircleAvatar(),
                username: context.currentOfflineUser!.email,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dark mode",
                    style: TextStyle(fontSize: 20),
                  ),
                  Switch(
                    value: !context.watch<ThemeNotifier>().isLightTheme(),
                    onChanged: (_) {
                      context
                          .read<ThemeNotifier>()
                          .toggleTheme(context.currentUserId!);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Use metric system",
                    style: TextStyle(fontSize: 20),
                  ),
                  Switch(
                    value: context.watch<UnitNotifier>().isMetric,
                    onChanged: (_) {
                      context
                          .read<UnitNotifier>()
                          .toggleUnits(context.currentUserId!);
                    },
                  ),
                ],
              ),
              AppInkWellButton(
                onTap: () {
                  context.push('/exercise');
                },
                text: "Exercises",
              ),
              AppInkWellButton(
                  onTap: () {
                    context.push('/calculator');
                  },
                  text: "Calculator"),
              AppInkWellButton(
                onTap: () async {
                  context.read<AuthBloc>().add(SignOutRequested());
                  await getIt
                      .get<OfflineUserDataSingleton>()
                      .deleteUserIdFromStorage();
                  context.go('/login');
                },
                text: "Sign out",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String username;
  final Widget avatar;

  const ProfileHeader({
    Key? key,
    required this.username,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        avatar,
        Flexible(
          child: Text(
            username,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
