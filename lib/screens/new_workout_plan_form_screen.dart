import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_widgets.dart';

class WorkoutPlanForm extends HookWidget {
  const WorkoutPlanForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());

    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final weeksValue = useState<int?>(null);
    final daysValue = useState<int?>(null);
    return AppScaffold(
      title: "Custom program",
      child: SingleChildScrollView(
        child: Form(
          key: formKey.value,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(spacing: 32, children: [
              AppTextFormField(
                width: double.infinity,
                controller: nameController,
                labelText: "Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Must have a name";
                  } else {
                    return null;
                  }
                },
              ),
              AppTextFormField(
                  width: double.infinity,
                  controller: descriptionController,
                  labelText: "Description",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Must have a description";
                    } else {
                      return null;
                    }
                  }),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Must specify length";
                      } else {
                        return null;
                      }
                    },
                    value: weeksValue.value,
                    dropdownColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    decoration: InputDecoration(
                      labelText: "Length (in weeks)",
                      contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      counter: null,
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primaryContainer,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                    ),
                    items: List.generate(16, (i) => i + 1)
                        .map((i) =>
                            DropdownMenuItem(value: i, child: Text('$i')))
                        .toList(),
                    onChanged: (value) {
                      weeksValue.value = value;
                    }),
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return "Must specify days per week";
                      } else {
                        return null;
                      }
                    },
                    value: daysValue.value,
                    dropdownColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    decoration: InputDecoration(
                      labelText: "Days per week",
                      contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      counter: null,
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.primaryContainer,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                      ),
                    ),
                    items: List.generate(7, (i) => i + 1)
                        .map((i) =>
                            DropdownMenuItem(value: i, child: Text('$i')))
                        .toList(),
                    onChanged: (value) {
                      daysValue.value = value;
                    }),
              ),
              SizedBox(
                width: double.infinity,
                height: 75,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.navigate_next,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  onPressed: () {
                    if (formKey.value.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Configured workout plan: ${nameController.text}')),
                      );
                      context.push('/plan/create', extra: {
                        'name': nameController.text.trim(),
                        'description': descriptionController.text.trim(),
                        'days': daysValue.value!,
                        'weeks': weeksValue.value!
                      });
                    }
                  },
                  label: Text("Submit",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
