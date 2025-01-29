import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/core/dependency_injection/get_it_dependency_injection.dart';
import 'package:gym_app/core/extensions/context_extensions.dart';
import 'package:gym_app/features/auth/blocs/auth_bloc.dart';
import 'package:gym_app/features/offline_auth/offline_user_data_singleton.dart';
import 'package:gym_app/features/profile/widgets/profile_screen_widgets.dart';
import 'package:gym_app/features/theme/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../units/notifier/unit_notifier.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Profile',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
                    'Dark mode',
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
                    'Use metric system',
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
                text: 'Exercises',
              ),
              AppInkWellButton(
                onTap: () {
                  context.push('/calculator');
                },
                text: 'Calculator',
              ),
              AppInkWellButton(
                onTap: () async {
                  context.read<AuthBloc>().add(SignOutRequested());
                  await getIt
                      .get<OfflineUserDataSingleton>()
                      .deleteUserIdFromStorage();

                  if (context.mounted) {
                    context.go('/login');
                  }
                },
                text: 'Sign out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
