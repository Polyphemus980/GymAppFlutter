import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gym_app/data/models/completed_set.dart';
import 'package:gym_app/data/models/exercise.dart';
import 'package:gym_app/data/repositories/local_exercise_repository.dart';
import 'package:gym_app/widgets/app_widgets.dart';
import 'package:intl/intl.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  final String id;
  final String name;
  final String description;
  final String? startPositionImagePath;
  final String? endPositionImagePath;
  final LocalExerciseRepository exerciseRepository;
  const ExerciseDetailsScreen({
    super.key,
    required this.name,
    required this.description,
    this.startPositionImagePath,
    this.endPositionImagePath,
    required this.id,
    required this.exerciseRepository,
  });

  @override
  ExerciseDetailsScreenState createState() => ExerciseDetailsScreenState();
}

class ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  bool showEndPosition = false;
  late Exercise exercise;
  late List<CompletedSets>? lastSets;
  Timer? _imageTimer;

  @override
  void initState() {
    super.initState();
    if (widget.startPositionImagePath != null &&
        widget.endPositionImagePath != null) {
      _imageTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
        setState(() {
          showEndPosition = !showEndPosition;
        });
      });
    }
  }

  @override
  void dispose() {
    _imageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.name,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.startPositionImagePath != null &&
                  widget.endPositionImagePath != null)
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      firstChild: Image.asset(
                        widget.startPositionImagePath!,
                        fit: BoxFit.cover,
                      ),
                      secondChild: Image.asset(
                        widget.endPositionImagePath!,
                        fit: BoxFit.cover,
                      ),
                      crossFadeState: showEndPosition
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                    ),
                  ),
                ),
              const SizedBox(height: 24),

              // Description section
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Recent Sets',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              FutureBuilder(
                  future: widget.exerciseRepository
                      .getLastCompletedSets(widget.id, 5),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ExerciseSetDetails(
                            index: index,
                            set: snapshot.data![index],
                          );
                        },
                      );
                    } else {
                      return const Text("No sets done yet for this exercise");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseSetDetails extends StatelessWidget {
  final int index;
  final CompletedSet set;
  const ExerciseSetDetails({required this.index, super.key, required this.set});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Text('${index + 1}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer)),
        ),
        title: Text(
          'Set ${index + 1}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Reps: ${set.repetitions} • Weight: ${set.weight ?? 0}${set.is_metric ? 'kg' : 'lbs'}',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        trailing: Text(
          DateFormat('yyyy-MM-dd').format(set.created_at),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
