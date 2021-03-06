import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/models/animation_handle.dart';
import 'package:smart_home/models/navigation.dart';
import 'package:smart_home/res/colors.dart';
import 'package:smart_home/res/text_styles.dart';
import 'package:smart_home/screens/room_control.dart';

import '../models/room.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard(this.room, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool darkTheme = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Provider.of<NavigationManager>(context, listen: false)
            .updateLayout(RoomControlHeader(room), RoomControlBody(room));
        Provider.of<AnimationControllerHandle>(context, listen: false)
            .forward();
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Colors.grey)),
            child: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.scaleDown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(room.illustration, height: 50),
                  const SizedBox(height: 15),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxWidth: constraints.maxWidth - 40),
                    child: Text(
                      room.name,
                      style: roomNameStyle.copyWith(
                          color: darkTheme ? lightBlue : darkBlue),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${room.lights} ${room.lights == 1 ? "Light" : "Lights"}',
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
