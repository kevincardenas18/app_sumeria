// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool?> isValidBirthDate(String? birthDate) async {
  // Add your function code here!
  if (birthDate == null || birthDate.isEmpty) {
    return null;
  }

  // Parse the birthDate string
  List<String> dateParts = birthDate.split('/');
  if (dateParts.length != 3) {
    return null; // Invalid format
  }

  int day = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[2]);

  DateTime birthDateParsed = DateTime(year, month, day);
  DateTime today = DateTime.now();
  DateTime adultDate = DateTime(today.year - 18, today.month, today.day);

  // Check if the parsed birth date makes the person at least 18 years old
  return birthDateParsed.isBefore(adultDate);
}
