import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/screens/add_exercise_screen.dart';
import 'package:gym_app/screens/main_screen.dart';

import 'data/app_database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Week 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScreen(),
      routes: [
        GoRoute(
          path: '/exercise/add',
          builder: (BuildContext context, GoRouterState state) {
            final AppDatabase db_ = state.extra as AppDatabase;

            return AddExerciseScreen(db_: db_);
          },
        ),
      ],
    )
  ],
);
