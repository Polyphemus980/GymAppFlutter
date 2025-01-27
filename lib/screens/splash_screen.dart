import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/context_extensions.dart';
import 'package:gym_app/data/repositories/local_preferences_repository.dart';
import 'package:gym_app/get_it_dependency_injection.dart';
import 'package:gym_app/offline_user_data_singleton.dart';
import 'package:gym_app/theme_notifier.dart';
import 'package:gym_app/unit_notifier.dart';

import '../auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  _intializeTheme(BuildContext context) async {
    final userPrefs = await getIt
        .get<LocalPreferencesRepository>()
        .getUserPreferences(context.currentUserId!);
    if (userPrefs != null) {
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
          context.go('/home');
          return;
        } else if (state is Unauthenticated) {
          if (getIt.get<OfflineUserDataSingleton>().hasUser) {
            await _intializeTheme(context);
            context.go('/home');
          }
        }
        context.go('/login');
      },
      child: const Center(
        child: FlutterLogo(size: 160),
      ),
    );
  }
}
