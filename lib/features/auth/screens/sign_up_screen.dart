import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/features/auth/blocs/auth_bloc.dart';
import 'package:gym_app/features/auth/widgets/sign_up_widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const AppScaffold(
              title: 'Sign up',
              child: Center(child: CircularProgressIndicator()));
        }
        return const SignUpForm();
      },
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text("Error occurred while authenticating: ${state.error}")));
        } else if (state is AuthEmailConfirmationRequired) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Sign-up successful! Please check your email to confirm.")));
          context.go('/login');
        } else if (state is Authenticated) {
          context.go('/workout');
        }
      },
    );
  }
}
