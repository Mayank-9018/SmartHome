import 'package:flutter/material.dart';

class Light {
  final String name;
  double brightness;
  Color color;
  bool supportsColors;
  late Function updateMethod;
  Light(this.name, this.brightness, this.color, {this.supportsColors = false});

  void updateBrightness(double newBrightness) {
    brightness = newBrightness;
    updateMethod();
  }

  void updateColor(Color newColor) {
    color = newColor;
    updateMethod();
  }

  void registerUpdateMethod(Function() updateMethod) =>
      this.updateMethod = updateMethod;
}
