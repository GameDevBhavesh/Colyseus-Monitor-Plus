import 'package:colyseus_monitor_plus/widgets/realtime_screen.dart';
import 'package:colyseus_monitor_plus/widgets/settings_screen.dart';
import 'package:colyseus_monitor_plus/widgets/status_screen.dart';
import 'package:colyseus_monitor_plus/widgets/users_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../../themes/app_theme.dart';

class SideMenuConfig {
  SideMenuConfig({this.icon, required this.name, required this.view});
  final String name;
  final IconData? icon;
  final Widget view;
}

final sidebarData = [
  SideMenuConfig(
      name: "Status", icon: Icons.stacked_bar_chart, view: StatusScreen()),
  SideMenuConfig(name: "Users", icon: Icons.group, view: UsersScreen()),
  SideMenuConfig(name: "Realtime", icon: Icons.bolt, view: RealtimeScreen()),
  SideMenuConfig(name: "Settings", icon: Icons.settings, view: SettingsScreen())
];
