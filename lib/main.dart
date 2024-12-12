import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/screens/main_screen.dart';

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
    ),
  ],
);

// class WorkoutPlanWidget extends StatelessWidget {
//   @override
//   WorkoutPlanWidget(this.data);
//
//   final WorkoutPlan data;
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(data.title),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverPadding(
//             padding: const EdgeInsetsDirectional.all(16),
//             sliver: SliverList.separated(
//               itemCount: data.exercises.length,
//               separatorBuilder: (context, _) => const SizedBox(height: 16),
//               itemBuilder: (context, index) => Text(
//                   "Exercise $index: ${data.exercises.elementAt(index).name}"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
