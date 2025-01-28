import 'package:flutter/services.dart';

class RepsInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (int.tryParse(newValue.text) == null) {
      return oldValue;
    }

    final reps = int.parse(newValue.text);
    if (reps < 0) {
      return oldValue;
    }

    return newValue;
  }
}
