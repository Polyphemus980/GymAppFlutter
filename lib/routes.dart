import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/context_extensions.dart';
import 'package:gym_app/data/models/set_data.dart';
import 'package:gym_app/offline_user_data_singleton.dart';
import 'package:gym_app/screens/choose_muscle_groups_screen.dart';
import 'package:gym_app/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

import 'auth_bloc.dart';
import 'data/models/exercise.dart';
import 'data/models/muscle_group.dart';
import 'data/repositories/local_workout_repository.dart';
import 'get_it_dependency_injection.dart';
import 'screens/add_exercise_screen.dart';
import 'screens/empty_workout_screen.dart';
import 'screens/exercise_list_screen.dart';
import 'screens/focus_workout_screen.dart';
import 'screens/login_screen.dart';
import 'screens/new_workout_plan_form_screen.dart';
import 'screens/new_workout_plan_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/select_exercise_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/workout_plan_display_screen.dart';
import 'screens/workout_screen.dart';
import 'timer_notifier.dart';
import 'widgets/bottom_nav_bar.dart';

final router = GoRouter(
    redirect: (context, state) async {
      print(context.isOnline);
      if (!getIt.get<OfflineUserDataSingleton>().hasLoaded) {
        Future.delayed(Duration(seconds: 2));
      }
      print(getIt.get<OfflineUserDataSingleton>().hasUser);
      if (context.isOnline ||
          (!context.isOnline &&
              !getIt.get<OfflineUserDataSingleton>().hasUser)) {
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
              path: '/home',
              builder: (context, state) => const Placeholder(),
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
          builder: (context, state) => const AddExerciseScreen(),
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
                      return PreWorkoutScreen(
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
          path: '/new',
          builder: (context, state) {
            return PreWorkoutScreen(
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
