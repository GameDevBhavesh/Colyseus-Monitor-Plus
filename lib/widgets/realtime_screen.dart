import 'package:colyseus_monitor_plus/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../themes/app_theme.dart';

class RealtimeScreen extends StatefulWidget {
  const RealtimeScreen({Key? key}) : super(key: key);

  @override
  State<RealtimeScreen> createState() => _RealtimeScreenState();
}

class _RealtimeScreenState extends State<RealtimeScreen> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              open = !open;
            });
          },
          child: Card(
            color: AppTheme.of(context).primaryColor,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [Text("Type: BattleRoom"), Text("players: 5")]),
                if (open)
                  Container(
                    color: AppTheme.of(context).primaryBackgroudColor,
                    height: 50,
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
