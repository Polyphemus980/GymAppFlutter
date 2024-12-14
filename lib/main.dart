import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/screens/add_exercise_screen.dart';
import 'package:gym_app/screens/main_screen.dart';
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

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MainScreen(),
      routes: [
        GoRoute(
          path: '/exercise/add',
          builder: (context, state) => const AddExerciseScreen(),
        ),
      ],
    )
  ],
);
