import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_bloc.dart';
import 'theme_notifier.dart';
import 'timer_notifier.dart';
import 'workout_bloc.dart';

class GlobalProviders extends StatelessWidget {
  final Widget child;
  const GlobalProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
        BlocProvider<WorkoutBloc>(
            create: (BuildContext context) => WorkoutBloc()),
        ChangeNotifierProvider<TimerNotifier>(
          create: (_) => TimerNotifier(),
        ),
        BlocProvider<AuthBloc>(
            create: (BuildContext context) =>
                AuthBloc(supabaseClient: Supabase.instance.client.auth))
      ],
      child: child,
    );
  }
}
