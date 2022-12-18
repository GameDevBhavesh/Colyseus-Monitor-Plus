import 'package:colyseus_monitor_plus/themes/app_theme.dart';
import 'package:colyseus_monitor_plus/widgets/dashboard/dashboard_topbar.dart';
import 'package:flutter/material.dart';
import 'dashboard_sidebar.dart';

class XDash extends StatefulWidget {
  const XDash({Key? key, this.sidenav, this.body, this.topbar})
      : super(key: key);
  final Widget? sidenav;
  final Widget? body;
  final XDashTopbar? topbar;

  @override
  State<XDash> createState() => XDashState();
}

class XDashState extends State<XDash> {
  bool _showSidenav = false;
  bool collapse = false;
  @override
  Widget build(BuildContext context) {
    final ratio = MediaQuery.of(context).size.aspectRatio;
    final size = MediaQuery.of(context).size;
    if (ratio <= 1.5) {
      setState(() {
        collapse = true;
      });
    } else {
      setState(() {
        collapse = false;
      });
    }
    print(ratio);
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      fit: StackFit.loose,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //sidenav
            if (!collapse && !_showSidenav) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: widget.sidenav,
              ),
            ],
            //topbar and main body area
            Expanded(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: widget.topbar),
                Expanded(
                    child: widget.body != null ? widget.body! : Container())
              ],
            ))
          ],
        ),
        if (collapse && _showSidenav) ...[
          Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      _showSidenav = false;
                    });
                  },
                  child: Container(
                    height: size.height,
                    width: size.width,
                    color: Color.fromARGB(9, 0, 0, 0),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: widget.sidenav,
              ),
            ],
          ),
        ],
      ],
    );
  }

  void openSidenav() {
    setState(() {
      _showSidenav = !_showSidenav;
    });
  }
}
