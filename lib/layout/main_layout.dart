import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/models/navigation.dart';

import '../res/colors.dart';

class MainLayout extends StatefulWidget {
  final Widget header;
  final Widget body;

  const MainLayout(this.header, this.body, {Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late Widget _header;
  late Widget _body;

  @override
  void initState() {
    _header = widget.header;
    _body = widget.body;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<NavigationManager>(context).registerUpdateMethod(updateLayout);
    return Scaffold(
      backgroundColor: bgBlue,
      body: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 500),
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250), child: _header),
            curve: Curves.decelerate,
          ),
          Expanded(
            child: Container(
              // duration: const Duration(seconds: 1),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250), child: _body),
            ),
          ),
        ],
      ),
    );
  }

  void updateLayout(Widget header, Widget body) {
    setState(() {
      _header = header;
      _body = body;
    });
  }
}
