import 'package:flutter/services.dart';

class WeightInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (newValue.text == '.' ||
        (newValue.text.endsWith('.') &&
            '.'.allMatches(newValue.text).length == 1)) {
      return newValue;
    }

    if (double.tryParse(newValue.text) != null) {
      final number = double.parse(newValue.text);
      if (number < 0 || number > 999) {
        return oldValue;
      }
    } else {
      return oldValue;
    }

    return newValue;
  }
}
