import 'package:colyseus_monitor_plus/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../themes/app_theme.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                StatsCard(
                  iconData: Icons.supervised_user_circle_sharp,
                  title: "5k",
                  description: "Total users this month",
                ),
                StatsCard(
                  iconData: Icons.play_circle_fill_rounded,
                  title: "10k",
                  description: "Total matches played this month",
                ),
                StatsCard(
                  iconData: Icons.monetization_on,
                  title: "8k",
                  description: "Total revenue this month",
                )
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                StatsCard2(
                  iconData: Icons.supervised_user_circle_sharp,
                  title: "new players",
                  description: "50",
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  const StatsCard(
      {Key? key,
      this.description = "Description",
      this.iconData = Icons.abc,
      this.title = "Title",
      this.onMore})
      : super(key: key);
  final String title;
  final String description;
  final IconData iconData;
  final Function()? onMore;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              width: 200,
              height: 220,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              iconData,
                              size: 50,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              title,
                              style: AppTheme.of(context).styles.title3,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                description,
                                style: AppTheme.of(context).styles.subTitle,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(.8, -.8),
                    child: Container(
                      child: IconButton(
                          onPressed: () {
                            if (onMore != null) {
                              onMore!();
                            }
                          },
                          icon: Icon(
                            Icons.more_vert_sharp,
                            size: 30,
                          )),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: AppTheme.of(context).primaryPanelsColor, // added
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 10,
                //     color: AppTheme.of(context)
                //         .sidebar
                //         .backgroudColor!
                //         .withOpacity(.5),
                //     spreadRadius: 1,
                //   ),
                // ],
                borderRadius: BorderRadius.circular(20.0),
              )),
        ),
      ),
    );
  }
}

class StatsCard2 extends StatelessWidget {
  const StatsCard2(
      {Key? key,
      this.description = "Description",
      this.iconData = Icons.abc,
      this.title = "Title",
      this.onMore})
      : super(key: key);
  final String title;
  final String description;
  final IconData iconData;
  final Function()? onMore;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              width: 300,
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: AppTheme.of(context).styles.title3,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Text(
                            description,
                            style: AppTheme.of(context)
                                .styles
                                .title!
                                .copyWith(fontSize: 55),
                          ),
                        ),
                        Chip(
                          label: Text("+ 20%"),
                        )
                      ],
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: AppTheme.of(context).primaryPanelsColor, // added
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 10,
                //     color: AppTheme.of(context)
                //         .sidebar
                //         .backgroudColor!
                //         .withOpacity(.5),
                //     spreadRadius: 1,
                //   ),
                // ],
                borderRadius: BorderRadius.circular(20.0),
              )),
        ),
      ),
    );
  }
}
