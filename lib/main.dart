import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/screens/add_exercise_screen.dart';
import 'package:gym_app/screens/choose_muscle_groups_screen.dart';
import 'package:gym_app/screens/exercise_list_screen.dart';
import 'package:provider/provider.dart';

import 'data/app_database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>(
      create: (_) => AppDatabase(),
      dispose: (context, db) => db.close,
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'Week 4',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrange,
            dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
          ),
        ),
      ),
    );
  }
}

// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => MainScreen(),
//       routes: [
//         GoRoute(
//           path: '/exercise/add',
//           builder: (context, state) => const AddExerciseScreen(),
//         ),
//       ],
//     )
//   ],
// );
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
                    builder: (context, state) => const MusclePicker())
              ])
        ]),
    GoRoute(
      path: '/social',
      builder: (context, state) => const Placeholder(),
    ),
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
              context.go('/social');
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
