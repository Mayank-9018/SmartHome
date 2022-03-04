import 'package:flutter/material.dart';
import 'package:smart_home/models/room.dart';
import 'package:smart_home/res/assets.dart';

import '../models/light.dart';

final List<Room> rooms = [
  Room(
    name: 'Bedroom',
    lights: 2,
    illustration: AssetImages.bedroom,
    lightsData: [
      Light(
        "Nightstand",
        0.0,
        Colors.amber,
        supportsColors: true,
      ),
      Light(
        "Main lights",
        1.0,
        Colors.white,
      ),
    ],
  ),
  Room(
    name: 'Living room',
    lights: 2,
    illustration: AssetImages.living,
    lightsData: [
      Light(
        "Ceiling",
        1.0,
        Colors.white,
      ),
      Light(
        "Chandelier",
        0.25,
        Colors.amber,
      ),
    ],
  ),
  Room(
    name: 'Kitchen',
    lights: 2,
    illustration: AssetImages.kitchen,
    lightsData: [
      Light(
        "LEDs",
        0.0,
        Colors.white,
        supportsColors: true,
      ),
      Light(
        "Countertop track lights",
        1.0,
        Colors.white,
      ),
    ],
  ),
  Room(
    name: 'Bathroom',
    lights: 1,
    illustration: AssetImages.bathroom,
    lightsData: [
      Light(
        "LEDs",
        1.0,
        Colors.white,
      ),
    ],
  ),
  Room(
    name: 'Outdoor',
    lights: 3,
    illustration: AssetImages.outdoor,
    lightsData: [
      Light(
        "Garage",
        0.0,
        Colors.white,
        supportsColors: true,
      ),
      Light(
        "Front Door",
        0.5,
        Colors.white,
        supportsColors: true,
      ),
      Light(
        "Boundary",
        0.2,
        Colors.amber,
      ),
    ],
  ),
  Room(
    name: 'Balcony',
    lights: 2,
    illustration: AssetImages.balcony,
    lightsData: [
      Light(
        "String lights",
        0.0,
        Colors.red,
      ),
      Light(
        "Wall light",
        0.7,
        Colors.amber,
        supportsColors: true,
      ),
    ],
  ),
];
