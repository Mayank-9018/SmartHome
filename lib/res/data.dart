import 'package:flutter/material.dart';
import 'package:smart_home/models/room.dart';
import 'package:smart_home/res/assets.dart';

final List<Room> rooms = [
  Room(
    name: 'Bedroom',
    lights: 2,
    illustration: AssetImages.bedroom,
    lightsData: [
      {
        "name": "Nightstand",
        "brightness": 1.0,
        "color": Colors.amber,
      },
      {
        "name": "Ceiling",
        "brightness": 1.0,
        "color": Colors.white,
      },
    ],
  ),
  Room(
    name: 'Living room',
    lights: 2,
    illustration: AssetImages.living,
    lightsData: [
      {
        "name": "Ceiling",
        "brightness": 1.0,
        "color": Colors.white,
      },
      {
        "name": "Chandelier",
        "brightness": 0.5,
        "color": Colors.amber,
      },
    ],
  ),
  Room(
    name: 'Kitchen',
    lights: 2,
    illustration: AssetImages.kitchen,
    lightsData: [
      {
        "name": "Ceiling",
        "brightness": 0.0,
        "color": Colors.white,
      },
      {
        "name": "Countertop track lights",
        "brightness": 1.0,
        "color": Colors.white,
      },
    ],
  ),
  Room(
    name: 'Bathroom',
    lights: 1,
    illustration: AssetImages.bathroom,
    lightsData: [
      {
        "name": "LEDs",
        "brightness": 1.0,
        "color": Colors.white,
      },
    ],
  ),
  Room(
    name: 'Outdoor',
    lights: 3,
    illustration: AssetImages.outdoor,
    lightsData: [
      {
        "name": "Garage",
        "brightness": 0.0,
        "color": Colors.white,
      },
      {
        "name": "Front Door",
        "brightness": 0.5,
        "color": Colors.amber,
      },
      {
        "name": "Boundary",
        "brightness": 0.2,
        "color": Colors.amber,
      },
    ],
  ),
  Room(
    name: 'Balcony',
    lights: 2,
    illustration: AssetImages.balcony,
    lightsData: [
      {
        "name": "String lights",
        "brightness": 0.0,
        "color": Colors.amber,
      },
      {
        "name": "Wall light",
        "brightness": 0.7,
        "color": Colors.amber,
      },
    ],
  ),
];
