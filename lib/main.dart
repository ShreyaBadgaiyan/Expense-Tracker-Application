import 'package:expense_tracker/expense_tracker.dart';
import 'package:flutter/material.dart';


var kColorScheme=ColorScheme.fromSeed(seedColor: const Color.fromARGB(
    255, 20, 6, 52));

void main() {
  runApp( MaterialApp(
    theme: ThemeData(
    ).copyWith(
     // scaffoldBackgroundColor: Color(0xFF290A79FF),
      //all scaffold screens use this colour
      colorScheme: kColorScheme),

    home: const Expenses(),
  ));
}
