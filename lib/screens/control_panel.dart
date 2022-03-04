import 'package:flutter/material.dart';
import 'package:smart_home/components/room_card.dart';
import 'package:smart_home/res/data.dart';
import 'package:smart_home/res/text_styles.dart';

class ControlPanelBody extends StatelessWidget {
  const ControlPanelBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            children: rooms.map((e) => RoomCard(e)).toList(),
          ),
        ),
      ],
    );
  }
}

class ControlPanelHeader extends StatelessWidget {
  const ControlPanelHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
