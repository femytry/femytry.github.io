import 'package:flutter/material.dart';
import 'package:portfolio/utils/consts.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: COLORS.LIGHT_BG,
    primaryColor: COLORS.PRIMARY,
    primaryColorDark: COLORS.PRIMARY_DARK,
    primaryColorLight: COLORS.PRIMARY_LIGHT,
    accentColor: COLORS.ACCENT,
    buttonTheme: ThemeData().buttonTheme.copyWith(
        buttonColor: COLORS.PRIMARY,
        focusColor: COLORS.PRIMARY_DARK,
        shape: RoundedRectangleBorder()),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((value) {
          if (value.contains(MaterialState.pressed)) {
            return COLORS.PRIMARY_DARK;
          } else {
            return COLORS.PRIMARY;
          }
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) =>
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ),
    ),
    textTheme: ThemeData().textTheme.apply(
        fontFamily: 'Montserrat',
        bodyColor: Colors.black,
        displayColor: Colors.black),
    appBarTheme: ThemeData().appBarTheme.copyWith(
        backgroundColor: COLORS.LIGHT_BG,
        iconTheme: IconThemeData(color: COLORS.PRIMARY)),
  );

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: COLORS.DARK_BG,
    primaryColor: COLORS.PRIMARY,
    primaryColorDark: COLORS.PRIMARY_DARK,
    primaryColorLight: COLORS.PRIMARY_LIGHT,
    accentColor: COLORS.ACCENT,
    buttonTheme: ThemeData().buttonTheme.copyWith(
        buttonColor: COLORS.PRIMARY,
        focusColor: COLORS.PRIMARY_DARK,
        shape: RoundedRectangleBorder()),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((value) {
          if (value.contains(MaterialState.pressed)) {
            return COLORS.PRIMARY_DARK;
          } else {
            return COLORS.PRIMARY;
          }
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) =>
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
      ),
    ),
    textTheme: ThemeData().textTheme.apply(
        fontFamily: 'Montserrat',
        bodyColor: Colors.white,
        displayColor: Colors.white),
    appBarTheme: ThemeData().appBarTheme.copyWith(
        backgroundColor: COLORS.DARK_BG,
        iconTheme: IconThemeData(color: COLORS.PRIMARY)),
  );
}
