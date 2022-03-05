import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Be Vietnam Pro',
  androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
  cardColor: Colors.grey.shade900,
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    centerTitle: true,
    elevation: 0,
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.blue,
    inactiveTickMarkColor: Colors.blue.shade50,
    thumbColor: Colors.amber.shade600,
    overlayColor: Colors.blue.withOpacity(0.25),
  ),
);
