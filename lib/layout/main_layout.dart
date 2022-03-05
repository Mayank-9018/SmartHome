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
  final resizeDuration = const Duration(milliseconds: 500);
  final switchDuration = const Duration(milliseconds: 250);

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
      backgroundColor: Colors.blue.shade900,
      body: Column(
        children: [
          SafeArea(
            child: AnimatedSize(
              duration: resizeDuration,
              child: AnimatedSwitcher(duration: switchDuration, child: _header),
              curve: Curves.decelerate,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: AnimatedSwitcher(duration: switchDuration, child: _body),
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
