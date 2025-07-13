import 'package:flutter/material.dart';

class CustomDatetimePicker {
  static Future<DateTime?> pickDateTime(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (context.mounted) {
      if (date == null) return null;

      return DateTime(
        date.year,
        date.month,
        date.day,
      );
    }
    return null;
  }
}
