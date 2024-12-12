import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      body: Expanded(
        child: Column(
          children: [
            const Text("Quick start"),
            ElevatedButton(
              onPressed: () {},
              child: const Expanded(
                child: Row(
                  children: [Icon(Icons.add), Text("Start Workout")],
                ),
              ),
            ),
            const Text("Routines")
          ],
        ),
      ),
    );
  }
}
