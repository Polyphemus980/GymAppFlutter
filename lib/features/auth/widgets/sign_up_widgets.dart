import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/features/auth/blocs/auth_bloc.dart';
import 'package:provider/provider.dart';

class SignUpForm extends HookWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return AppScaffold(
      title: 'Sign up',
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
                      context.read<AuthBloc>().add(SignUpRequested(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    }
                  },
                  label: Text("Sign up",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary),
                ),
              )
            ])),
      )),
    );
  }
}
