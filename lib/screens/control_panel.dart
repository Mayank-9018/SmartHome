import 'package:flutter/material.dart';
import 'package:smart_home/components/room_card.dart';
import 'package:smart_home/res/assets.dart';

class ControlPanelScreen extends StatefulWidget {
  const ControlPanelScreen({Key? key}) : super(key: key);

  @override
  State<ControlPanelScreen> createState() => _ControlPanelScreenState();
}

class _ControlPanelScreenState extends State<ControlPanelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FB),
      body: GridView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 25,
        ),
        children: const [
          RoomCard(roomName: 'Bedroom', illustration: AssetImages.bedroom),
          RoomCard(roomName: 'Living room', illustration: AssetImages.living),
          RoomCard(roomName: 'Kitchen', illustration: AssetImages.kitchen),
          RoomCard(roomName: 'Bathroom', illustration: AssetImages.bathroom),
          RoomCard(roomName: 'Outdoor', illustration: AssetImages.outdoor),
          RoomCard(roomName: 'Balcony', illustration: AssetImages.balcony),
        ],
      ),
    );
  }
}
