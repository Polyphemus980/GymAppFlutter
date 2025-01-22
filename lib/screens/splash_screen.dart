import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) async {
          if (state is Authenticated) {
            context.go('/home');
          } else if (state is Unauthenticated) {
            context.go('/login');
          }
        },
        child: const Center(
          child: FlutterLogo(size: 160),
        ));
  }
}
