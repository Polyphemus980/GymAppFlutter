import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/data/repositories/user/local_preferences_repository.dart';
import 'package:gym_app/data/repositories/workout/sync_workout_repository.dart';
import 'package:gym_app/features/timer/notifier/timer_notifier.dart';
import 'package:gym_app/features/units/notifier/unit_notifier.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/blocs/auth_bloc.dart';
import '../../features/theme/notifier/theme_notifier.dart';
import '../../features/workouts/blocs/workout_bloc.dart';
import 'get_it_dependency_injection.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) {
            return ThemeNotifier(
                preferencesRepository: getIt.get<LocalPreferencesRepository>(),);
          },
        ),
        ChangeNotifierProvider<UnitNotifier>(
          create: (_) => UnitNotifier(
              preferencesRepository: getIt.get<LocalPreferencesRepository>(),),
        ),
        BlocProvider<WorkoutBloc>(
          create: (context) => WorkoutBloc(
            workoutRepository: getIt.get<SyncWorkoutRepository>(),
          ),
        ),
        ChangeNotifierProvider<TimerNotifier>(
          create: (_) => TimerNotifier(),
        ),
        BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(supabaseClient: Supabase.instance.client.auth),),
      ],
      child: child,
    );
  }
}
