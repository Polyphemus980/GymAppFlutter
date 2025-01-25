import 'package:go_router/go_router.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/data/models/set_data.dart';
import 'package:gym_app/data/models/user_workout_plans.dart';
import 'package:gym_app/data/repositories/sync_workout_repository.dart';
import 'package:gym_app/offline_user_data_singleton.dart';
import 'package:gym_app/screens/choose_muscle_groups_screen.dart';
import 'package:gym_app/screens/home_screen.dart';
import 'package:gym_app/screens/sign_up_screen.dart';
import 'package:gym_app/screens/train_screen.dart';
import 'package:gym_app/screens/workout_screen.dart';
import 'package:provider/provider.dart';

import 'auth_bloc.dart';
import 'data/models/exercise.dart';
import 'data/models/muscle_group.dart';
import 'data/repositories/local_workout_repository.dart';
import 'data/repositories/sync_exercise_repository.dart';
import 'get_it_dependency_injection.dart';
import 'screens/add_exercise_screen.dart';
import 'screens/exercise_list_screen.dart';
import 'screens/focus_workout_screen.dart';
import 'screens/login_screen.dart';
import 'screens/new_workout_plan_form_screen.dart';
import 'screens/new_workout_plan_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/select_exercise_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/workout_configuration_screen.dart';
import 'screens/workout_plan_display_screen.dart';
import 'timer_notifier.dart';
import 'widgets/bottom_nav_bar.dart';

final router = GoRouter(
    redirect: (context, state) async {
      if (!getIt.get<OfflineUserDataSingleton>().hasUser) {
        final authState = context.read<AuthBloc>().state;
        final publicRoutes = [
          '/login',
          '/signup',
        ];
        if (authState is! Authenticated &&
            !publicRoutes.contains(state.matchedLocation)) {
          return '/login';
        }

        if (authState is Authenticated &&
            publicRoutes.contains(state.matchedLocation)) {
          return '/home';
        }
        return null;
      }
      return null;
    },
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
          builder: (context, state, child) => BottomNavBar(child),
          routes: [
            GoRoute(
                path: '/train',
                builder: (context, state) => TrainScreen(
                      workoutRepository: getIt.get<LocalWorkoutRepository>(),
                    )),
            GoRoute(
              path: '/home',
              builder: (context, state) =>
                  HomeScreen(db: getIt.get<AppDatabase>()),
            ),
            GoRoute(
              path: '/exercise',
              builder: (context, state) => const ExerciseListScreen(),
            ),
            GoRoute(
              path: '/workout',
              builder: (context, state) => WorkoutListScreen(
                workoutRepository: getIt.get<LocalWorkoutRepository>(),
              ),
            ),
            GoRoute(
                path: '/start',
                builder: (context, state) {
                  final sets = state.extra as List<SetData>? ?? [];
                  return FocusWorkoutScreen(sets: sets);
                }),
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ]),
      GoRoute(
          path: '/add',
          builder: (context, state) => AddExerciseScreen(
                syncExerciseRepository: getIt.get<SyncExerciseRepository>(),
              ),
          routes: [
            GoRoute(
                path: 'pick',
                builder: (context, state) {
                  final selectedOptions =
                      state.extra as List<MuscleGroup>? ?? [];
                  return MusclePicker(list: selectedOptions);
                })
          ]),
      GoRoute(
          path: '/display/:id',
          builder: (context, state) {
            return WorkoutPlanDisplayScreen(
              workoutRepository: getIt.get<LocalWorkoutRepository>(),
              syncWorkoutRepository: getIt.get<SyncWorkoutRepository>(),
              workoutPlanId: state.pathParameters['id']!,
            );
          }),
      GoRoute(
        path: '/plan',
        builder: (context, state) {
          return const WorkoutPlanForm();
        },
        routes: [
          GoRoute(
              path: 'create',
              builder: (context, state) {
                Map<String, dynamic> data = state.extra as Map<String, dynamic>;
                return NewWorkoutPlanScreen(
                  name: data['name']! as String,
                  description: data['description']! as String,
                  numWeeks: data['weeks']! as int,
                  numDays: data['days']! as int,
                );
              },
              routes: [
                GoRoute(
                    path: 'new',
                    builder: (context, state) {
                      final data = state.extra as List<SetData>;
                      return WorkoutConfigurationScreen(
                        workoutRepository: getIt.get<LocalWorkoutRepository>(),
                        isRpe: true,
                        data: data,
                        title: "Create workout",
                        finishButtonText: "Save Workout",
                        finishButtonOnTap: (sets) {
                          context.pop(sets);
                        },
                      );
                    })
              ]),
        ],
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
          path: '/planned_workout',
          builder: (context, state) {
            final plan = state.extra as UserWorkoutPlans;
            return WorkoutConfigurationScreen(
              workoutRepository: getIt.get<LocalWorkoutRepository>(),
              title: "Edit workout",
              finishButtonText: "Start Workout",
              finishButtonOnTap: (sets) {
                Provider.of<TimerNotifier>(context, listen: false).startTimer();
                context.go('/start', extra: sets);
              },
              isRpe: true,
              workoutPlan: plan,
            );
          }),
      GoRoute(
          path: '/new',
          builder: (context, state) {
            return WorkoutConfigurationScreen(
              workoutRepository: getIt.get<LocalWorkoutRepository>(),
              title: "Create workout",
              finishButtonText: "Start Workout",
              finishButtonOnTap: (sets) {
                Provider.of<TimerNotifier>(context, listen: false).startTimer();
                context.go('/start', extra: sets);
              },
            );
          },
          routes: [
            GoRoute(
                path: 'select',
                builder: (context, state) {
                  final selectedList = state.extra as List<Exercise>? ?? [];
                  return SelectExerciseScreen(selectedExercises: selectedList);
                }),
          ]),
    ]);
