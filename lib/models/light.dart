import 'package:flutter/material.dart';

class Light {
  final String name;
  double brightness;
  Color color;
  bool supportsColors;
  Light(this.name, this.brightness, this.color, {this.supportsColors = false});
}
