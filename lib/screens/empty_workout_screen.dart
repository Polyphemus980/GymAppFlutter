import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/widgets/configuration_screen_widgets.dart';
import 'package:gym_app/workout_configuration_bloc.dart';

import '../data/models/exercise.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<Exercise> exercises = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout"),
      ),
      body: BlocProvider<WorkoutConfigurationBloc>(
        create: (BuildContext context) => WorkoutConfigurationBloc(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  await context.push('/workout/new/select', extra: exercises);
                  setState(() {});
                },
                child: const Text("Add exercises"),
              ),
            ),
            BlocBuilder<WorkoutConfigurationBloc, WorkoutConfigurationState>(
              builder: (BuildContext context, state) {
                if (state is LoadingConfig) {}
                return Expanded(
                  child: ReorderableListView.builder(
                    //ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];
                      return SetCard(
                          key: ValueKey(exercise), exercise: exercise);
                    },
                    onReorder: (int oldIndex, int newIndex) {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final temp = exercises.removeAt(oldIndex);
                      exercises.insert(newIndex, temp);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class WorkoutConfigurationScreen extends StatelessWidget {
//   const WorkoutConfigurationScreen({super.key, required this.isCustom});
//
//   final bool isCustom;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Workout"),
//       ),
//       body: BlocProvider<WorkoutConfigurationBloc>(
//         create: (BuildContext context) => WorkoutConfigurationBloc(),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () async {
//                   await context.push('/workout/new/select',
//                       extra:
//                           context.read<WorkoutConfigurationBloc>().exercises);
//                 },
//                 child: const Text("Add exercises"),
//               ),
//             ),
//             BlocBuilder<WorkoutConfigurationBloc, WorkoutConfigurationState>(
//               builder: (BuildContext context, state) {
//                 if (state is LoadingConfig) {}
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: exercises.length,
//                     itemBuilder: (context, index) {
//                       final exercise = exercises[index];
//                       return SetCard(exercise: exercise);
//                     },
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
