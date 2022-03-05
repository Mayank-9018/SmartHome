import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/models/navigation.dart';
import 'package:smart_home/res/dark_theme.dart';
import 'package:smart_home/res/light_theme.dart';

void main() {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<NavigationManager>(
      create: (_) => NavigationManager(),
      builder: (_, __) => MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: Provider.of<NavigationManager>(_).mainLayout,
      ),
    );
  }
}
