import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/tables/exercise.dart';
import 'package:gym_app/screens/add_exercise_screen.dart';
import 'package:gym_app/screens/choose_muscle_groups_screen.dart';
import 'package:gym_app/screens/exercise_list_screen.dart';
import 'package:gym_app/screens/select_exercise_screen.dart';
import 'package:gym_app/screens/workout_screen.dart';
import 'package:provider/provider.dart';

import 'data/app_database.dart';
import 'data/tables/muscle_group.dart';

class ThemeNotifier extends ChangeNotifier {
  //Switched around for now
  ThemeData _currentTheme = ThemeMode.system != ThemeMode.light
      ? ThemeData.light()
      : ThemeData.dark();

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    if (_currentTheme.brightness == Brightness.light) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppDatabase>(
          create: (_) => AppDatabase(),
          dispose: (_, db) => db.close(),
        ),
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
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
        builder: (context, state) => const WorkoutScreen(),
        routes: [
          GoRoute(
              path: 'select',
              builder: (context, state) {
                final selectedList = state.extra as List<Exercise>? ?? [];
                return SelectExerciseScreen(selectedExercises: selectedList);
              })
        ]),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const Placeholder(),
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
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
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
      body: widget.child,
    );
  }
}
