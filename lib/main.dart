import 'package:expense_tracker/expense_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


var kColorScheme=ColorScheme.fromSeed(
    seedColor:
    Colors.indigo
);

// Color.fromARGB(
// 255, 96, 59, 181)

var kDarkColorScheme=ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  //This is basically used to have the app orientation working only in portrait mode.
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  // DeviceOrientation.portraitUp
  //
  // ]
  // ).then((fn){
    runApp( MaterialApp(

      darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: kDarkColorScheme,
          brightness: Brightness.dark,
          appBarTheme:const AppBarTheme().copyWith(
            backgroundColor:kDarkColorScheme.primaryContainer,
            // foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme(
          ).copyWith(
            color: kDarkColorScheme.primaryContainer,
            //margin:
            // EdgeInsets.symmetric(
            //     horizontal: Theme.of(context).cardTheme.margin!.horizontal)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorScheme.primaryContainer,
              )
          ),

          textTheme:ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.normal,
                //  color: kColorScheme.primaryContainer
              )
          ),

          snackBarTheme: const SnackBarThemeData().copyWith(
              backgroundColor: Colors.black
          )

      ),
      theme: ThemeData(
      ).copyWith(
        // scaffoldBackgroundColor: Color(0xFF290A79FF),
        //all scaffold screens use this colour
        colorScheme: kColorScheme,
        appBarTheme:const AppBarTheme().copyWith(
          backgroundColor:kColorScheme.primaryContainer,
          // foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme(
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
            titleLarge: const TextStyle(
              fontWeight: FontWeight.normal,
              //  color: kColorScheme.primaryContainer
            )
        ),



      ),
      themeMode: ThemeMode.system,


      home: const Expenses(),
    )
    );

  }
//   );
//
//
// }
