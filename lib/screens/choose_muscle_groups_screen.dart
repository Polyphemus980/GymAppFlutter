import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:provider/provider.dart';

class MusclePicker extends StatefulWidget {
  const MusclePicker({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MusclePickerState();
  }
}

class _MusclePickerState extends State<MusclePicker> {
  late AppDatabase db;
  List<MuscleGroup> pickedGroups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick muscle groups'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: db.select(db.muscleGroups).get(),
              builder: (build, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('No muscle groups available'));
                } else {
                  return ListView.builder(itemBuilder: (build, index) {
                    return ListTile(
                        title: Text(snapshot.data!.elementAt(index).name),
                        trailing: Checkbox(
                            value: false,
                            onChanged: (value) {
                              if (value == true) {
                                pickedGroups
                                    .add(snapshot.data!.elementAt(index));
                              } else {
                                pickedGroups
                                    .remove(snapshot.data!.elementAt(index));
                              }
                            }));
                  });
                }
              }),
          ElevatedButton(
              onPressed: () {
                context.pop(pickedGroups);
              },
              child: const Text('End picking'))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    db = Provider.of<AppDatabase>(context, listen: false);
  }
}
