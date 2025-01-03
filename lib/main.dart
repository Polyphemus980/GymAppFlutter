import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/repositories/drift_exercise_repository.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/global_workout_bloc.dart';
import 'package:gym_app/screens/add_exercise_screen.dart';
import 'package:gym_app/screens/choose_muscle_groups_screen.dart';
import 'package:gym_app/screens/empty_workout_screen.dart';
import 'package:gym_app/screens/exercise_list_screen.dart';
import 'package:gym_app/screens/focus_workout_screen.dart';
import 'package:gym_app/screens/profile_screen.dart';
import 'package:gym_app/screens/select_exercise_screen.dart';
import 'package:gym_app/screens/workout_screen.dart';
import 'package:provider/provider.dart';

import 'data/app_database.dart';
import 'data/models/muscle_group.dart';

class ThemeNotifier extends ChangeNotifier {
  final lightTheme = FlexThemeData.light(scheme: FlexScheme.dellGenoa);
  final darkTheme = FlexThemeData.dark(scheme: FlexScheme.aquaBlue);
  //Switched around for now
  ThemeData _currentTheme = ThemeMode.system != ThemeMode.light
      ? FlexThemeData.light(scheme: FlexScheme.dellGenoa)
      : FlexThemeData.dark(scheme: FlexScheme.aquaBlue);

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    if (_currentTheme == lightTheme) {
      _currentTheme = darkTheme;
    } else {
      _currentTheme = lightTheme;
    }
    notifyListeners();
  }
}

bool setUpEnded = false;
final getIt = GetIt.instance;
void setUp() {
  if (setUpEnded) {
    return;
  }
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerSingleton<LocalExerciseRepository>(
      DriftExerciseRepository(db: getIt.get<AppDatabase>()));
  setUpEnded = true;
}

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
        BlocProvider<GlobalWorkoutBloc>(
          create: (BuildContext context) => GlobalWorkoutBloc(),
        )
      ],
      child: const MyApp(),
    );
  }
}

void main() {
  runApp(const GlobalProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setUp();
    final theme = context.watch<ThemeNotifier>().currentTheme;
    return MaterialApp.router(
      theme: theme,
      themeMode: ThemeMode.system,
      routerConfig: _router,
      title: 'Week 4',
    );
  }
}

final _router = GoRouter(initialLocation: '/home', routes: [
  ShellRoute(builder: (context, state, child) => BottomNavBar(child), routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
        path: '/exercise',
        builder: (context, state) => const ExerciseScreen(),
        routes: [
          GoRoute(
              path: 'add',
              builder: (context, state) => const AddExerciseScreen(),
              routes: [
                GoRoute(
                    path: 'pick',
                    builder: (context, state) {
                      final selectedOptions =
                          state.extra as List<MuscleGroup>? ?? [];
                      return MusclePicker(list: selectedOptions);
                    })
              ])
        ]),
    GoRoute(
        path: '/workout',
        builder: (context, state) => const WorkoutListScreen(),
        routes: [
          GoRoute(
              path: 'new',
              builder: (context, state) {
                return const WorkoutScreen();
              },
              routes: [
                GoRoute(
                    path: 'select',
                    builder: (context, state) {
                      final selectedList = state.extra as List<Exercise>? ?? [];
                      return SelectExerciseScreen(
                          selectedExercises: selectedList);
                    }),
                GoRoute(
                    path: 'start',
                    builder: (context, state) {
                      final sets = state.extra as List<SetData>? ?? [];
                      return FocusWorkoutScreen(sets: sets);
                    })
              ]),
        ]),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(),
    )
  ])
]);

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(this.child, {super.key});
  final Widget child;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Social',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Train',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Theme.of(context)
              .colorScheme
              .primary, // Use accentColor from the theme
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            switch (index) {
              case 0:
                context.go('/home');
              case 1:
                context.go('/workout');
              case 2:
                context.go('/exercise');
              case 3:
                context.go('/profile');
            }
          },
        ),
        body: BlocBuilder<GlobalWorkoutBloc, GlobalWorkoutState>(
            builder: (context, state) {
          return Column(
            children: [
              Expanded(child: widget.child),
            ],
          );
        }));
  }
}
