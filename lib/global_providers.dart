import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/data/repositories/local_preferences_repository.dart';
import 'package:gym_app/data/repositories/sync_workout_repository.dart';
import 'package:gym_app/timer_notifier.dart';
import 'package:gym_app/unit_notifier.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_bloc.dart';
import 'get_it_dependency_injection.dart';
import 'theme_notifier.dart';
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
          create: (_) {
            return ThemeNotifier(
                preferencesRepository: getIt.get<LocalPreferencesRepository>());
          },
        ),
        ChangeNotifierProvider<UnitNotifier>(
          create: (_) => UnitNotifier(
              preferencesRepository: getIt.get<LocalPreferencesRepository>()),
        ),
        BlocProvider<WorkoutBloc>(
          create: (BuildContext context) => WorkoutBloc(
            workoutRepository: getIt.get<SyncWorkoutRepository>(),
          ),
        ),
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
