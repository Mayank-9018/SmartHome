import 'package:flutter/material.dart';
import 'package:smart_home/layout/main_layout.dart';
import 'package:smart_home/screens/control_panel.dart';

class NavigationManager {
  late Widget mainLayout;
  late Function(Widget h, Widget b) _updateMethod;
  final Widget controlPanelHeader = const ControlPanelHeader();
  final Widget controlPanelBody = const ControlPanelBody();
  NavigationManager() {
    mainLayout = MainLayout(controlPanelHeader, controlPanelBody);
  }

  void updateLayout(Widget header, Widget body) {
    _updateMethod(header, body);
  }

  void registerUpdateMethod(Function(Widget h, Widget b) updateMethod) =>
      _updateMethod = updateMethod;

  void backToControlPanel() {
    _updateMethod(controlPanelHeader, controlPanelBody);
  }
}
