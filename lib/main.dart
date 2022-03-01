import 'package:flutter/material.dart';
import 'package:smart_home/screens/control_panel.dart';

void main() {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ControlPanelScreen(),
    );
  }
}
