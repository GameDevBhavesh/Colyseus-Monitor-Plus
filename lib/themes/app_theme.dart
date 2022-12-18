import 'package:colyseus_monitor_plus/main.dart';
import 'package:colyseus_monitor_plus/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ThemesModes {
  system,
  light,
  dark,
  shady,
}

class SideBarTheme {
  SideBarTheme(
      {this.appTitle,
      this.backgroudColor,
      this.iconsColor,
      this.titlesColor,
      this.selectedIconsColor,
      this.selectedTitlesColor});
  TextStyle? appTitle;
  Color? backgroudColor;
  Color? iconsColor;
  Color? titlesColor;
  Color? selectedIconsColor;
  Color? selectedTitlesColor;
}

class AppColorTheme {
  Color? primaryColor;
  Color? primaryPanelsColor;
  Color? primaryBackgroudColor;
  Color? primaryCardColor;
  Color? primaryIconColor;

  SideBarTheme sidebar;
  AppTextStyleTheme styles;
  AppColorTheme(
      {this.primaryIconColor,
      this.primaryCardColor,
      this.primaryPanelsColor,
      this.primaryColor,
      this.primaryBackgroudColor,
      required this.sidebar,
      required this.styles});
}

class AppTextStyleTheme {
  TextStyle? title;
  TextStyle? title2;
  TextStyle? title3;
  TextStyle? subTitle;
  TextStyle? subTitle2;
  TextStyle? subTitle3;
  AppTextStyleTheme(
      {this.subTitle,
      this.title,
      this.subTitle2,
      this.subTitle3,
      this.title2,
      this.title3});
}

abstract class AppTheme {
  static ThemesModes _selectedTheme = ThemesModes.system;

  static AppColorTheme of(BuildContext? context) {
    if (_selectedTheme == ThemesModes.system) {
      final isDark = context == null
          ? false
          : MediaQuery.of(context).platformBrightness == Brightness.dark;
      if (isDark) {
        return themes[ThemesModes.dark]!;
      } else {
        return themes[ThemesModes.light]!;
      }
    } else {
      final theme = themes[_selectedTheme];
      if (theme != null) {
        return theme;
      } else {
        return themes[ThemesModes.light]!;
      }
    }
  }

  static setTheme(BuildContext? context, ThemesModes mode) {
    _selectedTheme = mode;
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    globalKey.currentContext!.visitChildElements(rebuild);
  }
}
