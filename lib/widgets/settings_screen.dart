import 'package:colyseus_monitor_plus/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../themes/app_theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: DropdownButton<int>(
      value: 0,
      hint: Text("Theme"),
      dropdownColor: AppTheme.of(context).primaryPanelsColor,
      items: ThemesModes.values
          .map((e) => DropdownMenuItem(
                child: Text(e.name),
                value: e.index,
              ))
          .toList(),
      onChanged: (int? value) {
        AppTheme.setTheme(context, ThemesModes.values[value!]);
      },
    )));
  }
}
