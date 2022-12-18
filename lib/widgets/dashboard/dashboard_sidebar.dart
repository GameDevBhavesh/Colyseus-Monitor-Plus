import 'package:colyseus_monitor_plus/pages/home/home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphic/graphic.dart';

import '../../themes/app_theme.dart';

enum SidenavCollapsePosition {
  bottomCenter,
  topRightMiddle,
  bottomRightMiddle,
}

class XDashSidenavSize {
  const XDashSidenavSize({required this.collaped, required this.normal});
  final double normal;
  final double collaped;
}

class XDashSideNav extends StatelessWidget {
  XDashSideNav(
      {Key? key,
      this.theme,
      this.collapsePosition = SidenavCollapsePosition.bottomRightMiddle,
      required this.size,
      required this.onCollapse,
      required this.selectedNavIndex,
      required this.collapsedNav,
      required this.data,
      required this.onSelected})
      : super(key: key);

  XDashSidenavSize size;
  bool collapsedNav = false;
  List<SideMenuConfig> data;
  Function(int) onSelected;
  Function() onCollapse;
  SideBarTheme? theme;
  int selectedNavIndex;
  SidenavCollapsePosition collapsePosition;

  @override
  Widget build(BuildContext context) {
    final double width = (collapsedNav ? 100 : 200).toDouble();
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: width,
      child: Stack(
        children: [
          Container(
            width: width * .8,
            decoration: BoxDecoration(
                color: AppTheme.of(context).sidebar.backgroudColor, // added
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: AppTheme.of(context)
                        .sidebar
                        .backgroudColor!
                        .withOpacity(.5),
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                    colors: [
                      AppTheme.of(context).sidebar.backgroudColor!,
                      AppTheme.of(context).primaryBackgroudColor!,
                    ],
                    tileMode: TileMode.clamp,
                    begin: Alignment(-1, .5),
                    end: Alignment(5.5, .5),
                    stops: [
                      .15,
                      5,
                    ])),
            child: ListView(children: [
              SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    "Title",
                    style: AppTheme.of(context).sidebar.appTitle,
                  ),
                ),
              ),
              for (var i = 0; i < data.length; i++) ...[
                XDashSidebarTab(
                    onTap: () {
                      onSelected(i);
                    },
                    selected: selectedNavIndex == i,
                    data: data[i])
              ],
            ]),
          ),
          _buildCollapseButton(context)
        ],
      ),
    );
  }

  Widget _buildCollapseButton(BuildContext context) {
    Alignment alignValue = Alignment(.5, .8);
    if (collapsePosition == SidenavCollapsePosition.bottomCenter) {
      alignValue = Alignment(.5, .8);
    } else if (collapsePosition == SidenavCollapsePosition.bottomRightMiddle) {
      alignValue = Alignment(.8, .8);
    } else if (collapsePosition == SidenavCollapsePosition.topRightMiddle) {
      alignValue = Alignment(.8, -.7);
    }
    return Align(
      alignment: alignValue,
      child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onCollapse,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.of(context).primaryBackgroudColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: AppTheme.of(context)
                        .sidebar
                        .backgroudColor!
                        .withOpacity(.5),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(
                collapsedNav ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                color: AppTheme.of(context).sidebar.backgroudColor,
              ),
            ),
          )),
    );
  }
}

class XDashSidebarTab extends StatelessWidget {
  const XDashSidebarTab({
    Key? key,
    required this.onTap,
    this.selected = false,
    required this.data,
  }) : super(key: key);

  final bool selected;
  final SideMenuConfig data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap();
      },
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedContainer(
                height: selected ? 60 : 50,
                duration: Duration(milliseconds: 100),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final showTitle = (constraints.maxWidth > 120);
                    return Row(
                        mainAxisAlignment: showTitle
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              data.icon,
                              size: selected ? 30 : 24,
                              color: selected
                                  ? AppTheme.of(context)
                                      .sidebar
                                      .selectedIconsColor
                                  : AppTheme.of(context).sidebar.iconsColor,
                            ),
                          ),
                          if (showTitle)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data.name,
                                style: AppTheme.of(context)
                                    .styles
                                    .subTitle!
                                    .copyWith(
                                      color: selected
                                          ? AppTheme.of(context)
                                              .sidebar
                                              .selectedTitlesColor
                                          : AppTheme.of(context)
                                              .sidebar
                                              .titlesColor,
                                    ),
                              ),
                            )
                        ]);
                  },
                )),
          ),
          AnimatedContainer(
              height: selected ? 40 : 0,
              width: selected ? 5 : 0,
              color: AppTheme.of(context).sidebar.iconsColor,
              duration: Duration(milliseconds: 100))
        ],
      ),
    );
  }
}
