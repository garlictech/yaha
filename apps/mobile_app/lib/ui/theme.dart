import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle mapOverlayTextStyles(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: Theme.of(context).colorScheme.primary, fontSize: 20.0);
  }
}

final yahaTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff386a20),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb7f397),
      onPrimaryContainer: Color(0xff0f140d),
      secondary: Color(0xff55624c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd9e7cb),
      onSecondaryContainer: Color(0xff121311),
      tertiary: Color(0xff19686a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa8eff0),
      onTertiaryContainer: Color(0xff0e1414),
      error: Color(0xffb00020),
      onError: Color(0xffffffff),
      errorContainer: Color(0xfffcd8df),
      onErrorContainer: Color(0xff141213),
      background: Color(0xfff7f9f7),
      onBackground: Color(0xff090909),
      surface: Color(0xfff7f9f7),
      onSurface: Color(0xff090909),
      surfaceVariant: Color(0xfff0f4ef),
      onSurfaceVariant: Color(0xff121312),
      outline: Color(0xff565656),
      shadow: Color(0xff000000),
      inverseSurface: Color(0xff121411),
      onInverseSurface: Color(0xfff5f5f5),
      inversePrimary: Color(0xffbbdeab),
      surfaceTint: Color(0xff386a20),
    ),
    fontFamily: 'Inter',
    brightness: Brightness.light,
    visualDensity: VisualDensity.standard,
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ));
