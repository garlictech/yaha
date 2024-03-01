import 'package:flutter/material.dart';

const textColor = Color(0xff838489);

const MaterialColor primaryColor = MaterialColor(
  0xFFFF5722,
  <int, Color>{
    50: Color(0xFFFFE0E0),
    100: Color(0xFFFFB3B3),
    200: Color(0xFFFF8080),
    300: Color(0xFFFF4D4D),
    400: Color(0xFFFF2626),
    500: Color(0xFFFF5722),
    600: Color(0xFFE64D00),
    700: Color(0xFFCC4600),
    800: Color(0xFFB33F00),
    900: Color(0xFF993800),
  },
);

const MaterialColor accentColor = MaterialColor(
  0xFFFFC107,
  <int, Color>{
    50: Color(0xFFFFF8E1),
    100: Color(0xFFFFECB3),
    200: Color(0xFFFFE082),
    300: Color(0xFFFFD54F),
    400: Color(0xFFFFCA28),
    500: Color(0xFFFFC107),
    600: Color(0xFFFFB300),
    700: Color(0xFFFFA000),
    800: Color(0xFFFF8F00),
    900: Color(0xFFFF6F00),
  },
);

final theme = ThemeData(
    // Define the default brightness and colors.
    //brightness: Brightness.dark,
    //primaryColor: Colors.lightBlue[800],

    // Define the default font family.
    fontFamily: 'SFProText',
    scaffoldBackgroundColor: Colors.grey[200],

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
        titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w400, color: textColor)
        /*displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 24.0),*/
        ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.green,
    ),
    iconTheme: const IconThemeData(color: primaryColor),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor)
        .copyWith(secondary: accentColor)
        .copyWith(background: Colors.grey[200]));
