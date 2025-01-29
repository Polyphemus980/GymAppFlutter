import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/dependency_injection/get_it_dependency_injection.dart';
import 'package:gym_app/core/extensions/context_extensions.dart';
import 'package:gym_app/data/repositories/user/local_preferences_repository.dart';
import 'package:gym_app/features/offline_auth/offline_user_data_singleton.dart';
import 'package:gym_app/features/theme/notifier/theme_notifier.dart';
import 'package:gym_app/features/units/notifier/unit_notifier.dart';

import '../blocs/auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _intializeTheme(BuildContext context) async {
    final userPrefs = await getIt
        .get<LocalPreferencesRepository>()
        .getUserPreferences(context.currentUserId!);
    if (userPrefs != null && context.mounted) {
      context.read<ThemeNotifier>().setUserTheme(userPrefs.is_dark_mode);
      context.read<UnitNotifier>().setUserUnits(userPrefs.is_metric);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthenticationState>(
      listener: (context, state) async {
        if (state is Authenticated) {
          await _intializeTheme(context);
          if (context.mounted) {
            context.go('/workout');
          }
          return;
        } else if (state is Unauthenticated) {
          if (getIt.get<OfflineUserDataSingleton>().hasUser) {
            await _intializeTheme(context);
            if (context.mounted) {
              context.go('/workout');
            }
          }
        }
        if (context.mounted) {
          context.go('/login');
        }
      },
      child: const Center(
        child: FlutterLogo(size: 160),
      ),
    );
  }
}
