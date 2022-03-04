class Room {
  final String name;
  final int lights;
  final String illustration;
  final List<Map<String, dynamic>> lightsData;
  Room({
    required this.name,
    required this.lights,
    required this.illustration,
    required this.lightsData,
  }) {
    assert(lights == lightsData.length);
  }
}
