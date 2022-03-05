import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/components/light_card.dart';
import 'package:smart_home/models/animation_handle.dart';
import 'package:smart_home/models/navigation.dart';
import 'package:smart_home/models/room.dart';
import 'package:smart_home/res/text_styles.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
            child: Text(
              '${room.lights} ${room.lights == 1 ? "light" : "lights"}',
              style: nLightsStyle.copyWith(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void backBtnPressed(context) {
    Provider.of<AnimationControllerHandle>(context, listen: false).reverse();
    Provider.of<NavigationManager>(context, listen: false).backToControlPanel();
  }
}

class RoomControlBody extends StatefulWidget {
  final Room room;
  const RoomControlBody(this.room, {Key? key}) : super(key: key);

  @override
  State<RoomControlBody> createState() => _RoomControlBodyState();
}

class _RoomControlBodyState extends State<RoomControlBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 500),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.room.lightsData.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      itemBuilder: (cont, ind) => LightCard(
        widget.room.lightsData[ind],
        animController: _animationController,
      ),
      separatorBuilder: (con, ind) => const SizedBox(height: 20),
    );
  }
}
