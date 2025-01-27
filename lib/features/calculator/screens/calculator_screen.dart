import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gym_app/core/common_widgets/app_widgets.dart';
import 'package:gym_app/screens/focus_workout_screen.dart';

class CalculatorScreen extends HookWidget {
  const CalculatorScreen({super.key});

  double _calculateWeight(int doneReps, double doneWeight, int neededReps) {
    if (doneReps == 0 || doneWeight == 0) {
      return 0;
    }
    return (doneWeight * (1 + doneReps * 1.0 / 30)) /
        (1 + neededReps * 1.0 / 30);
  }

  @override
  Widget build(BuildContext context) {
    final weightValue = useState(1);
    final repsValue = useState(10);
    final weightController = useTextEditingController();
    final repsController = useTextEditingController()
      ..text = repsValue.value.toString();
    return AppScaffold(
      title: '1RM Calculator',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Row(spacing: 8, children: [
                Expanded(
                  child: AppTextFormField(
                    onChanged: (value) {
                      weightValue.value += 1;
                    },
                    hintText: "0.0",
                    maxLines: 1,
                    controller: weightController,
                    labelText: "Weight",
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    formatters: [
                      WeightInputFormatter(),
                      LengthLimitingTextInputFormatter(7),
                    ],
                  ),
                ),
                AppTextFormField(
                  onChanged: (value) {
                    repsValue.value = int.tryParse(value) ?? 0;
                  },
                  width: 100,
                  controller: repsController,
                  hintText: "10",
                  labelText: "Repetitions",
                  keyboardType: TextInputType.number,
                  formatters: [
                    RepsInputFormatter(),
                    LengthLimitingTextInputFormatter(2),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (repsValue.value < 99) {
                          repsValue.value += 1;
                        }
                      },
                      icon: const Icon(Icons.add, size: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        if (repsValue.value > 0) {
                          repsValue.value -= 1;
                        }
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 20,
                      ),
                    ),
                  ],
                )
              ]),
              const Center(
                  child: Text(
                "Weight at given reps: ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return Row(
                          spacing: 32,
                          children: [
                            Text("${index + 1}".padLeft(2),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Text(
                              _calculateWeight(
                                      repsValue.value,
                                      double.tryParse(weightController.text) ??
                                          0,
                                      index + 1)
                                  .toStringAsFixed(2),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
