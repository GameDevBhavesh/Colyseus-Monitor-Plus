import 'package:colyseus_monitor_plus/pages/home/home_page.dart';
import 'package:colyseus_monitor_plus/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'services/service_config.dart';

final GlobalKey<State> globalKey = GlobalKey();

void main() async {
  //initializations
  await initalizeService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: globalKey,
      title: 'Colyseus Dashboard',
      initialRoute: AppRoutes.intial,
      routes: AppRoutes.getRoutes(context),
    );
  }
}
