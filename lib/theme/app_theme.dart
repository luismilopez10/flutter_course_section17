import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;
  static const Color accentColor = Colors.red;
  static const Color categoryButtonColor = Colors.black54;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: primary,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: Colors.black45,
    ), 
  );
}
