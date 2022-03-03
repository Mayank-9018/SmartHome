import 'package:flutter/material.dart';
import 'package:smart_home/layout/main_layout.dart';
import 'package:smart_home/screens/control_panel.dart';

class NavigationManager {
  late Widget mainLayout;
  late Function(Widget, Widget) _updateMethod;
  final Widget controlPanelHeader = const ControlPanelHeader();
  final Widget controlPanelBody = const ControlPanelBody();
  NavigationManager() {
    mainLayout = MainLayout(controlPanelHeader, controlPanelBody);
  }

  /// Takes [header] and [body] and updates it in the MainLayout
  void updateLayout(Widget header, Widget body) {
    _updateMethod(header, body);
  }

  /// Only supposed to be called by MainLayout to register
  /// setState() method
  void registerUpdateMethod(Function(Widget, Widget) updateMethod) =>
      _updateMethod = updateMethod;

  /// Back to ControlPanel
  void backToControlPanel() {
    _updateMethod(controlPanelHeader, controlPanelBody);
  }
}
