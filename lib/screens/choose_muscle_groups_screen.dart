import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:provider/provider.dart';

import '../data/tables/muscle_group.dart';

class MusclePicker extends StatefulWidget {
  const MusclePicker({super.key, required this.list});
  final List<MuscleGroup> list;
  @override
  State<StatefulWidget> createState() {
    return _MusclePickerState();
  }
}

class _MusclePickerState extends State<MusclePicker> {
  late AppDatabase db;

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
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (build, index) {
                          final ValueNotifier<bool> isChecked = ValueNotifier(
                              widget.list
                                  .contains(snapshot.data!.elementAt(index)));

                          return ValueListenableBuilder<bool>(
                              valueListenable: isChecked,
                              builder: (context, value, child) {
                                return ListTile(
                                    title: Text(
                                        snapshot.data!.elementAt(index).name),
                                    trailing: Checkbox(
                                        value: isChecked.value,
                                        onChanged: (value) {
                                          if (value == true) {
                                            widget.list.add(snapshot.data!
                                                .elementAt(index));
                                          } else {
                                            widget.list.remove(snapshot.data!
                                                .elementAt(index));
                                          }
                                          isChecked.value = !isChecked.value;
                                        }));
                              });
                        }),
                  );
                }
              }),
          ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('End picking')),
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
