import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/components/light_card.dart';
import 'package:smart_home/models/navigation.dart';
import 'package:smart_home/models/room.dart';
import 'package:smart_home/res/text_styles.dart';

import '../res/colors.dart';

class RoomControlHeader extends StatelessWidget {
  final Room room;
  const RoomControlHeader(this.room, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backBtnPressed(context);
        return false;
      },
      child: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => backBtnPressed(context),
        ),
        title: Text(
          room.name,
          style: appBarRoomNameStyle,
        ),
        toolbarHeight: 100,
      ),
    );
  }

  void backBtnPressed(context) {
    Provider.of<NavigationManager>(context, listen: false).backToControlPanel();
  }
}

class RoomControlBody extends StatelessWidget {
  final Room room;
  const RoomControlBody(this.room, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            '${room.lights} ${room.lights == 1 ? "light" : "lights"}',
            style: allRoomStyle.copyWith(
              color: darkTheme ? lightBlue : darkBlue,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: room.lightsData.length,
            padding: const EdgeInsets.all(20),
            itemBuilder: (cont, ind) => LightCard(room.lightsData[ind]),
            separatorBuilder: (con, ind) => const SizedBox(height: 20),
          ),
        ),
      ],
    );
  }
}
