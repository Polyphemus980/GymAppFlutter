import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/get_it_dependency_injection.dart';
import 'package:gym_app/offline_user_data_singleton.dart';

import '../auth_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthenticationState>(
        listener: (context, state) async {
          if (state is Authenticated) {
            context.go('/home');
          } else if (state is Unauthenticated && getIt.isOnline) {
            context.go('/login');
          } else if (state is Unauthenticated && !getIt.isOnline) {
            if (getIt.get<OfflineUserDataSingleton>().hasUser) {
              context.go('/home');
            }
          }
          context.go('/home');
        },
        child: const Center(
          child: FlutterLogo(size: 160),
        ));
  }
}
