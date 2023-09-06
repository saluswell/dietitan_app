import 'package:flutter/material.dart';

import 'appcolors.dart';

ThemeData currentTheme(context) => Theme.of(context);

ColorScheme getColorScheme(context) => currentTheme(context).colorScheme;

TextStyle? fontW5S12(context) => currentTheme(context).textTheme.headline1;

TextStyle? fontW4S12(context) => currentTheme(context).textTheme.headline2;

TextStyle? fontW3S12(context) => currentTheme(context).textTheme.headline3;

Color primaryColor(context) => currentTheme(context).primaryColor;

Color secondryColor(context) => getColorScheme(context).secondary;

Color acentColor() => Colors.white;

Color grayColor() => Colors.white;

class AppTheme {
  //
  static var themeData = ThemeData(
    fontFamily: "Helvetica",
    dialogBackgroundColor: Colors.white,
    backgroundColor: AppColors.whitecolor,
    primaryColor: const Color(0xff70BC4E),
    colorScheme:
        ColorScheme.fromSwatch(accentColor: const Color(0xff70BC4E)).copyWith(
      secondary: const Color(0xff70BC4E),
      //brightness: Brightness.dark,
    ),
    dialogTheme: const DialogTheme(backgroundColor: AppColors.appcolor),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    timePickerTheme:
        const TimePickerThemeData(backgroundColor: AppColors.whitecolor),
    appBarTheme: const AppBarTheme(
      color: Color(0xff70BC4E),
      elevation: 0.0,
      centerTitle: true,
    ),
    bottomAppBarColor: const Color(0xff70BC4E),
    hintColor: Colors.white,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xff70BC4E)),
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: Color(0xffffffff),
          fontWeight: FontWeight.w500,
          fontFamily: 'Helvetica-Bold',
          fontStyle: FontStyle.normal,
          fontSize: 12,
          overflow: TextOverflow.ellipsis),
      headline2: TextStyle(
          color: Color(0xffffffff),
          fontWeight: FontWeight.w400,
          fontFamily: 'Helvetica',
          fontSize: 12,
          fontStyle: FontStyle.normal,
          overflow: TextOverflow.ellipsis),
      headline3: TextStyle(
          color: Color(0xffffffff),
          fontWeight: FontWeight.w300,
          fontFamily: 'Helvetica',
          fontStyle: FontStyle.normal,
          fontSize: 12,
          overflow: TextOverflow.ellipsis),
    ),
  );
}
