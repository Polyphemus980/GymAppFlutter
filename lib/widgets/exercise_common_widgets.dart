import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/main.dart';

import '../exercise_bloc.dart';

class SearchAndFilterRow extends StatelessWidget {
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
                    return ExerciseFilterModal(
                        scrollController: scrollController);
                  }),
            ),
          );
        });
  }

  const SearchAndFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: SearchBar(
              onChanged: (query) =>
                  context.read<ExerciseBloc>().add(SearchExerciseEvent(query)),
              hintText: 'Search exercises',
            ),
          ),
          Flexible(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Flexible(
                child: IconButton(
                  onPressed: () => _showFilters(context),
                  icon: const Icon(Icons.filter_alt),
                ),
              ),
              Flexible(
                  child: IconButton(
                      onPressed: () => context.push('/add'),
                      icon: const Icon(Icons.add)))
            ]),
          ),
        ],
      ),
    );
  }
}

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key, this.onTapMethod, this.selectCheckMethod});

  final Function(Exercise)? onTapMethod;

  final bool Function(Exercise)? selectCheckMethod;
  @override
  Widget build(BuildContext context) {
    final exerciseRepository = getIt.get<LocalExerciseRepository>();
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        if (state is ExerciseLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExerciseError) {
          return Center(child: Text("Error: ${state.error}"));
        } else if (state is ExerciseLoaded) {
          final exercises = state.loadedExercises;
          return ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final exercise = exercises[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  subtitleTextStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withValues(alpha: 0.5)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12.0), // Radius for rounded corners
                  ),
                  tileColor: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withValues(alpha: 0.5),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  title: Text(exercise.name),
                  subtitle: Text(
                    exercise.muscles!,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      exerciseRepository.deleteExercise(exercise.id);
                    },
                  ),
                  onTap: () {
                    if (onTapMethod != null) {
                      onTapMethod!(exercise);
                    }
                  },
                  selected: selectCheckMethod == null
                      ? false
                      : selectCheckMethod!(exercise),
                  selectedTileColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  selectedColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              );
            },
          );
        }
        return const Center(child: Text("No exercises available."));
      },
    );
  }
}

class ExerciseFilterModal extends StatelessWidget {
  final ScrollController scrollController;

  const ExerciseFilterModal({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBloc, ExerciseState>(
      builder: (context, state) {
        if (state is ExerciseLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExerciseError) {
          return Center(child: Text("Error: ${state.error}"));
        } else if (state is ExerciseLoaded) {
          final muscles = state.allMuscles;
          final filters = state.selectedMuscles;

          return ListView.builder(
            controller: scrollController,
            itemCount: muscles.length,
            itemBuilder: (context, index) {
              final muscle = muscles[index];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                tileColor: Theme.of(context).colorScheme.primaryContainer,
                textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                title: Text(muscle.name),
                selected: filters.contains(muscle),
                selectedColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
                selectedTileColor:
                    Theme.of(context).colorScheme.secondaryContainer,
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
        return const SizedBox.shrink();
      },
    );
  }
}
