import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/data/repositories/user/local_preferences_repository.dart';
import 'package:gym_app/features/auth/blocs/auth_bloc.dart';
import 'package:gym_app/features/auth/widgets/login_widgets.dart';
import 'package:gym_app/features/offline_auth/offline_user_data_singleton.dart';
import 'package:gym_app/features/units/notifier/unit_notifier.dart';

import '../../../core/dependency_injection/get_it_dependency_injection.dart';
import '../../theme/notifier/theme_notifier.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const AppScaffold(
            title: 'Login',
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return const LoginForm();
      },
      listener: (context, state) async {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Error occurred while authenticating: ${state.error}'),
            ),
          );
        } else if (state is Authenticated) {
          final preferencesRepository = getIt.get<LocalPreferencesRepository>();
          final userPreferences =
              await preferencesRepository.getUserPreferences(state.user.id);
          if (userPreferences != null && context.mounted) {
            context
                .read<ThemeNotifier>()
                .setUserTheme(userPreferences.is_dark_mode);
            context
                .read<UnitNotifier>()
                .setUserUnits(userPreferences.is_metric);
          } else {
            await preferencesRepository.insertUserPreferences(
              userId: state.user.id,
            );
          }
          await getIt
              .get<OfflineUserDataSingleton>()
              .addUserIdToStorage(state.user.id, state.user.email!);
          if (context.mounted) {
            context.go('/workout');
          }
        }
      },
    );
  }
}
