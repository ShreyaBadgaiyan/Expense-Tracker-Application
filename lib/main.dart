import 'package:expense_tracker/expense_tracker.dart';
import 'package:flutter/material.dart';


var kColorScheme=ColorScheme.fromSeed(
    seedColor:
    Color.fromARGB(
    255, 96, 59, 181)
);

var kDarkColorScheme=ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99, 125));

void main() {
  runApp( MaterialApp(

    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      brightness: Brightness.dark,
      // appBarTheme:AppBarTheme().copyWith(
      //   backgroundColor:kDarkColorScheme.primaryContainer,
      //   // foregroundColor: kColorScheme.primaryContainer,
      // ),
      cardTheme: CardTheme(
      ).copyWith(
        color: kDarkColorScheme.secondaryContainer,
        //margin:
        // EdgeInsets.symmetric(
        //     horizontal: Theme.of(context).cardTheme.margin!.horizontal)
      ),


    ),
    theme: ThemeData(
    ).copyWith(
     // scaffoldBackgroundColor: Color(0xFF290A79FF),
      //all scaffold screens use this colour
      colorScheme: kColorScheme,
    appBarTheme:AppBarTheme().copyWith(
      backgroundColor:kColorScheme.primaryContainer,
     // foregroundColor: kColorScheme.primaryContainer,
    ),
      cardTheme: CardTheme(
      ).copyWith(
        color: kColorScheme.secondaryContainer,
        //margin:
        // EdgeInsets.symmetric(
        //     horizontal: Theme.of(context).cardTheme.margin!.horizontal)
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        )
      ),

      textTheme:ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
        //  color: kColorScheme.primaryContainer
        )
      ),

    ),
    themeMode: ThemeMode.light,


    home: const Expenses(),
  )
  );
}
