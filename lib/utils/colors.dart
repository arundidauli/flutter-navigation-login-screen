
import 'package:flutter/material.dart';

class AppColor {

  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFFF6E6E);
  static const Color shrinePink50 = Color(0xFFFEEAE6);
  static const Color shrinePink100 = Color(0xFFFEDBD0);
  static const Color shrinePink300 = Color(0xFFFBB8AC);
  static const Color shrinePink400 = Color(0xFFEAA4A4);
  static const Color shrineBrown900 = Color(0xFF442B2D);
  static const Color shrineBrown600 = Color(0xFF7D4F52);
  static const Color shrineErrorRed = Color(0xFFC5032B);
  static const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
  static const Color shrineBackgroundWhite = Colors.white;
  static const defaultLetterSpacing = 0.03;

 static  const ColorScheme appShrineColorScheme =  ColorScheme(
    primary: AppColor.shrinePink400,
    secondary: AppColor.shrinePink50,
    surface: AppColor.shrineSurfaceWhite,
    background: AppColor.shrineBackgroundWhite,
    error: AppColor.shrineErrorRed,
    onPrimary: AppColor.shrineBrown900,
    onSecondary: AppColor.shrineBrown900,
    onSurface: AppColor.shrineBrown900,
    onBackground: AppColor.shrineBrown900,
    onError: AppColor.shrineBackgroundWhite,
    brightness: Brightness.light,
  );
}
