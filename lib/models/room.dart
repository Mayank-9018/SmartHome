import 'package:smart_home/models/light.dart';

class Room {
  final String name;
  final int lights;
  final String illustration;
  final List<Light> lightsData;
  Room({
    required this.name,
    required this.lights,
    required this.illustration,
    required this.lightsData,
  }) {
    assert(lights == lightsData.length);
  }
}
