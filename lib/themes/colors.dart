import 'package:flutter/material.dart';

ThemeData colors = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color(0xFF000000),       // Primary background color (Off-white)
    onPrimary: Color(0xFFFFFFFF),     // Primary text color (black)
    secondary: Color(0xFFE8B5B5),     // Secondary background color (Beige)
    onSecondary: Color(0xFF2A1010),   // Secondary text color (Brown)
    surface: Color(0xFFCC8B86),       // Color for buttons, cards, icons
    onSurface: Color(0xFFCB4242),     // Text/icon color on surfaces
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xFF583737), // Use onSecondary for default label color which is brown
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFFFFFF)), // Use surface color for the focused border
    ),
    floatingLabelStyle: TextStyle(
      color: Color(0xFFFFFFFF), // Use a darker shade of surface color when the field is focused
    ),
  ),
);
