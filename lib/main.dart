

import 'package:flutter/material.dart';
import 'package:exprensetracker/widgets/expenses.dart';



var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 255, 255, 255)
  );

var kDarkColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main(){
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
            ),
        ),

      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: const Color.fromARGB(255, 255, 255, 255),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
            ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // backgroundColor: Color.fromARGB(0, 153, 153, 153)
        ), 
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(fontWeight: FontWeight.normal,color: Colors.black),
        )
      ),
      themeMode: ThemeMode.light,
      home: const Expenses(),
    ),
  );
}