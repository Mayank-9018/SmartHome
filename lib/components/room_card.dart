import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_home/res/text_styles.dart';

class RoomCard extends StatelessWidget {
  final String roomName;
  final int lights;
  final String illustration;
  const RoomCard({
    Key? key,
    this.roomName = "Room",
    this.lights = 1,
    this.illustration = 'assets/default.svg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(1, 1),
            blurRadius: 10,
            spreadRadius: 4,
          )
        ],
      ),
      child: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              illustration,
              height: 60,
            ),
            const SizedBox(height: 20),
            Text(
              roomName,
              style: roomNameStyle,
            ),
            const SizedBox(height: 5),
            FittedBox(
              child: Text(
                '$lights ${lights == 1 ? "Light" : "Lights"}',
                style: nLightsStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
