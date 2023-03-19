import 'package:flutter/material.dart';

final yahaTheme = ThemeData(
  primaryColor: const Color(0xFF007D46),
  focusColor: const Color(0xFF007D46),
  scaffoldBackgroundColor: const Color(0xFFFCFCFC),
  fontFamily: 'Inter',
  brightness: Brightness.light,
  visualDensity: VisualDensity.standard,
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
