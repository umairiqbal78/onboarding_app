import 'package:flutter/services.dart';

class CroatianPhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if (newText.length == 1) {
      newText = '+385 $newText';
    }

    if (newText.length == 7) {
      newText = '${newText.substring(0, 5)} ${newText.substring(5)}';
    }

    if (newText.length >= 12) {
      newText = newText.substring(0, 12);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
