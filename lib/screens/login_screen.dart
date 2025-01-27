import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/auth_bloc.dart';
import 'package:gym_app/data/repositories/local_preferences_repository.dart';
import 'package:gym_app/offline_user_data_singleton.dart';
import 'package:gym_app/unit_notifier.dart';
import 'package:gym_app/widgets/app_widgets.dart';

import '../get_it_dependency_injection.dart';
import '../theme_notifier.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const AppScaffold(
              title: 'Login',
              child: Center(child: CircularProgressIndicator()));
        }
        return const LoginForm();
      },
      listener: (context, state) async {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text("Error occurred while authenticating: ${state.error}")));
        } else if (state is Authenticated) {
          final preferencesRepository = getIt.get<LocalPreferencesRepository>();
          final userPreferences =
              await preferencesRepository.getUserPreferences(state.user.id);
          if (userPreferences != null) {
            context
                .read<ThemeNotifier>()
                .setUserTheme(userPreferences.is_dark_mode);
            context
                .read<UnitNotifier>()
                .setUserUnits(userPreferences.is_metric);
          } else {
            preferencesRepository.insertUserPreferences(userId: state.user.id);
          }
          await getIt
              .get<OfflineUserDataSingleton>()
              .addUserIdToStorage(state.user.id, state.user.email!);
          context.go('/workout');
        }
      },
    );
  }
}

class LoginForm extends HookWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return AppScaffold(
      title: 'Login',
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Form(
            key: formKey.value,
            child: Column(spacing: 32, children: [
              AppTextFormField(
                  controller: emailController,
                  width: double.infinity,
                  labelText: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email must not be empty";
                    }
                    return null;
                  }),
              AppTextFormField(
                  controller: passwordController,
                  width: double.infinity,
                  labelText: "Password",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password must not be empty";
                    }
                    return null;
                  }),
              SizedBox(
                width: double.infinity,
                height: 75,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.navigate_next,
                      color: Theme.of(context).colorScheme.onSecondary),
                  onPressed: () {
                    if (formKey.value.currentState!.validate()) {
                      context.read<AuthBloc>().add(SignInRequested(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    }
                  },
                  label: Text("Login",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary),
                ),
              ),
              TextButton(
                onPressed: () => context.go('/signup'),
                child:
                    const Center(child: Text("Not yet registered? Click here")),
              )
            ])),
      )),
    );
  }
}
