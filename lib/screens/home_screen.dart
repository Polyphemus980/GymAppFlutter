import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_app/data/app_database.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key, required this.db});
  final AppDatabase db;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: db.select(db.userWorkoutPlansTable).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data![index].user_id);
              },
            );
          } else {
            return const Text("nothing yet");
          }
        });
  }
}
