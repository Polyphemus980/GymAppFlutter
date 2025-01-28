import 'package:go_router/go_router.dart';
import 'package:gym_app/core/domain/sets/set_data.dart';
import 'package:gym_app/core/services/android_notification_service.dart';
import 'package:gym_app/data/models/workout_plans/user_workout_plans.dart';
import 'package:gym_app/data/repositories/exercise/local_exercise_repository.dart';
import 'package:gym_app/data/repositories/workout/sync_workout_repository.dart';
import 'package:gym_app/features/auth/screens/sign_up_screen.dart';
import 'package:gym_app/features/calculator/screens/calculator_screen.dart';
import 'package:gym_app/features/exercise/screens/choose_muscle_groups_screen.dart';
import 'package:gym_app/features/exercise/screens/exercise_details_screen.dart';
import 'package:gym_app/features/offline_auth/offline_user_data_singleton.dart';
import 'package:gym_app/features/workout_plans/screens/workout_plan_list_screen.dart';
import 'package:gym_app/features/workouts/screens/train_screen.dart';
import 'package:provider/provider.dart';

import 'core/common_widgets/bottom_nav_bar.dart';
import 'core/dependency_injection/get_it_dependency_injection.dart';
import 'data/models/exercise/exercise.dart';
import 'data/models/exercise/muscle_group.dart';
import 'data/repositories/exercise/sync_exercise_repository.dart';
import 'data/repositories/workout/local_workout_repository.dart';
import 'features/auth/blocs/auth_bloc.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/splash_screen.dart';
import 'features/exercise/screens/add_exercise_screen.dart';
import 'features/exercise/screens/exercise_list_screen.dart';
import 'features/exercise/screens/select_exercise_screen.dart';
import 'features/profile/screens/profile_screen.dart';
import 'features/timer/notifier/timer_notifier.dart';
import 'features/workout_configuration/screens/workout_configuration_screen.dart';
import 'features/workout_plans/screens/new_workout_plan_form_screen.dart';
import 'features/workout_plans/screens/new_workout_plan_screen.dart';
import 'features/workout_plans/screens/workout_plan_display_screen.dart';
import 'features/workouts/screens/focus_workout_screen.dart';

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
          return '/workout';
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
              path: '/exercise',
              builder: (context, state) => const ExerciseListScreen(),
              routes: [
                GoRoute(
                  path: ':id', // Use ':id' to capture the parameter
                  builder: (context, state) {
                    final id = state
                        .pathParameters['id']!; // Access the captured parameter
                    return ExerciseDetailsScreen(
                      id: id,
                      exerciseRepository: getIt.get<LocalExerciseRepository>(),
                    );
                  },
                ),
              ],
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
                  final map = state.extra as Map<String, dynamic>?;
                  final sets = map?['sets'] as List<SetData>? ?? [];
                  final id = map?['id'] as String?;
                  return FocusWorkoutScreen(
                    sets: sets,
                    plannedWorkoutId: id,
                  );
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
                        finishButtonOnTap: (sets, _) {
                          context.pop(sets);
                        },
                      );
                    })
              ]),
        ],
      ),
      GoRoute(
          path: '/calculator',
          builder: (context, state) => const CalculatorScreen()),
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
              finishButtonOnTap: (sets, id) {
                NotificationService.showWorkoutNotificationWithActions();
                Provider.of<TimerNotifier>(context, listen: false).startTimer();
                context.go('/start', extra: {'sets': sets, 'id': id});
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
              finishButtonOnTap: (sets, id) {
                NotificationService.showWorkoutNotificationWithActions();
                Provider.of<TimerNotifier>(context, listen: false).startTimer();
                context.go('/start', extra: {'sets': sets, 'id': id});
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
