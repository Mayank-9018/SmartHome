import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/models/navigation.dart';

class RoomControlHeader extends StatelessWidget {
  const RoomControlHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: BackButton(
        color: Colors.white,
        onPressed: () {
          Provider.of<NavigationManager>(context, listen: false)
              .backToControlPanel();
        },
      ),
    );
  }
}

class RoomControlBody extends StatelessWidget {
  const RoomControlBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}
