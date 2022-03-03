import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/models/navigation.dart';
import 'package:smart_home/res/text_styles.dart';
import 'package:smart_home/screens/room_control.dart';

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
    return GestureDetector(
      onTap: () => Provider.of<NavigationManager>(context, listen: false)
          .updateLayout(const RoomControlHeader(), const RoomControlBody()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
                  Image.asset(illustration, height: 50),
                  const SizedBox(height: 15),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxWidth: constraints.maxWidth - 40),
                    child: Text(
                      roomName,
                      style: roomNameStyle,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$lights ${lights == 1 ? "Light" : "Lights"}',
                    style: nLightsStyle,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
