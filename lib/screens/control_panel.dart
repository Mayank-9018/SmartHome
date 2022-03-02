import 'package:flutter/material.dart';
import 'package:smart_home/components/room_card.dart';
import 'package:smart_home/res/assets.dart';
import 'package:smart_home/res/colors.dart';
import 'package:smart_home/res/text_styles.dart';

class ControlPanelScreen extends StatefulWidget {
  const ControlPanelScreen({Key? key}) : super(key: key);

  @override
  State<ControlPanelScreen> createState() => _ControlPanelScreenState();
}

class _ControlPanelScreenState extends State<ControlPanelScreen> {
  final List<RoomCard> rooms = const [
    RoomCard(roomName: 'Bedroom', lights: 4, illustration: AssetImages.bedroom),
    RoomCard(
        roomName: 'Living room', lights: 2, illustration: AssetImages.living),
    RoomCard(roomName: 'Kitchen', lights: 5, illustration: AssetImages.kitchen),
    RoomCard(
        roomName: 'Bathroom', lights: 1, illustration: AssetImages.bathroom),
    RoomCard(roomName: 'Outdoor', lights: 5, illustration: AssetImages.outdoor),
    RoomCard(roomName: 'Balcony', lights: 2, illustration: AssetImages.balcony),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlue,
      body: Column(
        children: [
          const _Header(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text(
                      'All Rooms',
                      style: allRoomStyle,
                    ),
                  ),
                  Expanded(
                    child: GridView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 25,
                      ),
                      children: rooms,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Control\nPanel',
              style: cpHeaderStyle,
            ),
            CircleAvatar(
              radius: 25,
              child: Icon(Icons.person, size: 28),
            )
          ],
        ),
      ),
    );
  }
}
