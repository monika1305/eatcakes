


import 'package:flutter/material.dart';
// Step 1: Remove the # sign.
// Step 2: Add 0xFF at the beginning of the color code.
// Step 3: Place it inside the Color class like this Color(0xFFbfeb91).
const colorPrimary = Color(0xFFF24E75);
const colorBackground = Color(0xFF27285C);
const List<String> items = ["Cakes", "Cupcakes", "Donuts", "Chocolates",];
// for theme change https://stackoverflow.com/questions/60693179/flutter-use-custom-colors-and-themes-in-themedata

class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  fontFamily: 'Poppins',
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),

      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
      ),
      backgroundColor: MaterialStateProperty.all<Color>(colorBackground),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,

    ),

    titleMedium: TextStyle(
      fontWeight: FontWeight.normal,
    color: Colors.black
    ),titleSmall: TextStyle(
      fontWeight: FontWeight.normal,
    color: Colors.white12
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
  )

);



static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  accentColor: Colors.white,
  switchTheme: SwitchThemeData(
    trackColor:  MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor:  MaterialStateProperty.all<Color>(Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),

      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      overlayColor: MaterialStateProperty.all<Color>(Colors.black26),
    ),
  ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1),
    ),

);
}