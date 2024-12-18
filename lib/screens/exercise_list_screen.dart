import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/app_database.dart';
import 'package:gym_app/exercise_bloc.dart';
import 'package:provider/provider.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  void _showFilters(BuildContext parentContext) {
    showModalBottomSheet(
        context: parentContext,
        isScrollControlled: true,
        builder: (modalContext) {
          return BlocProvider.value(
            value: parentContext.read<ExerciseBloc>(),
            child: FractionallySizedBox(
              heightFactor: 0.8,
              widthFactor: 1,
              child: DraggableScrollableSheet(
                  initialChildSize: 1, // The initial size of the bottom sheet
                  minChildSize: 1, // The minimum size
                  maxChildSize: 1,
                  builder: (context, scrollController) {
                    return BlocBuilder<ExerciseBloc, ExerciseState>(
                      builder: (_, ExerciseState state) {
                        if (state is ExerciseLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is ExerciseError) {
                          return Center(
                            child: Text("Error ${state.error}"),
                          );
                        } else if (state is ExerciseLoaded) {
                          final muscles = state.allMuscles;
                          final filters = state.selectedMuscles;
                          return ListView.builder(
                            controller: scrollController,
                            itemCount: muscles.length,
                            itemBuilder: (_, index) {
                              final muscle = muscles[index];
                              return ListTile(
                                title: Text(muscle.name),
                                selected: filters.contains(muscle),
                                selectedColor: Colors.amber,
                                onTap: () {
                                  if (filters.contains(muscle)) {
                                    filters.remove(muscle);
                                  } else {
                                    filters.add(muscle);
                                  }
                                  context
                                      .read<ExerciseBloc>()
                                      .add(FilterExerciseEvent(filters));
                                },
                              );
                            },
                          );
                        }
                        //Shouldn't be reachable as the ExerciseState is sealed?
                        else {
                          assert(false, 'Unhandled state: $state');
                          return const SizedBox
                              .shrink(); // Required to satisfy the return type
                        }
                      },
                    );
                  }),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return BlocProvider<ExerciseBloc>(
      create: (BuildContext context) => ExerciseBloc(db),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Exercises")),
            actions: [
              ElevatedButton(
                onPressed: () => context.push('/exercise/add'),
                child: const Text("Add new"),
              ),
            ],
          ),
          body: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SearchBar(
                  onChanged: (query) => context
                      .read<ExerciseBloc>()
                      .add(SearchExerciseEvent(query)),
                  hintText: 'Search exercises',
                ),
                ElevatedButton(
                    onPressed: () => _showFilters(context),
                    child: const Text("Filters"))
              ],
            ),
            Expanded(
              child: BlocBuilder<ExerciseBloc, ExerciseState>(
                builder: (context, state) {
                  if (state is ExerciseLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ExerciseError) {
                    return Center(
                      child: Text("Error ${state.error}"),
                    );
                  } else if (state is ExerciseLoaded) {
                    final exerciseMuscles = state.loadedExercises;

                    return ListView.builder(
                      itemCount: exerciseMuscles.length,
                      itemBuilder: (context, index) {
                        final exercise = exerciseMuscles[index];
                        return ListTile(
                          title: Text(exercise.exercise.name),
                          subtitle: Text(exercise.muscleGroups
                              .map((m) => m.name)
                              .join(", ")),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              (db.delete(db.exercises)
                                    ..where((t) =>
                                        t.id.equals(exercise.exercise.id)))
                                  .go();
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return const Text("No idea why");
                  }
                },
              ),
            ),
          ]),
        );
      }),
    );
  }
}
