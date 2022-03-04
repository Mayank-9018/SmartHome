import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Be Vietnam Pro',
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    centerTitle: true,
    elevation: 0,
  ),
  androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.blue.shade900,
    inactiveTickMarkColor: Colors.blue.shade50,
    thumbColor: Colors.blue.shade900,
    overlayColor: Colors.blue.shade900.withOpacity(0.25),
  ),
);
