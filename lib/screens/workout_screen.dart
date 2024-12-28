import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class WorkoutListScreen extends StatefulWidget {
  const WorkoutListScreen({super.key});

  @override
  State<WorkoutListScreen> createState() => _WorkoutListScreenState();
}

class _WorkoutListScreenState extends State<WorkoutListScreen> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    List<String> data = ["koks", "koks2", "koks3"];
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.push('/workout/new');
          },
          child: const Text("Start an empty workout"),
        ),
        Expanded(
          child: KeyboardListener(
            focusNode: FocusNode(),
            onKeyEvent: (KeyEvent event) {
              if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
                _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
                _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }
            },
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: PageView.builder(
                controller: _controller,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Text(data[index]),
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}

class EditableField extends StatefulWidget {
  final String label;
  final String initialValue;
  final ValueChanged<String> onSave;

  const EditableField(
      {super.key,
      required this.label,
      required this.initialValue,
      required this.onSave});

  @override
  _EditableFieldState createState() {
    return _EditableFieldState();
  }
}

class _EditableFieldState extends State<EditableField> {
  bool isEditing = false;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("${widget.label}: "),
        isEditing
            ? Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) {
                    setState(() => isEditing = false);
                    widget.onSave(value);
                  },
                ),
              )
            : GestureDetector(
                onTap: () => setState(() => isEditing = true),
                child: Text(
                  widget.initialValue,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
      ],
    );
  }
}
