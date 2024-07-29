import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: ColorManager.kBrownColor,
  scaffoldBackgroundColor: ColorManager.kCreamColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorManager.kBrownColor,
    foregroundColor: ColorManager.kWhiteColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: ColorManager.blackColor),
    bodyMedium: TextStyle(color: ColorManager.blackColor),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: ColorManager.kBrownColor,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: ColorManager.kWhiteColor,
      backgroundColor: ColorManager.kBrownColor,
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: ColorManager.kCoffeeColor,
        color: ColorManager.kBrownColor,
        ) ,

);

// Dark theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ColorManager.kBrown2Color,
  scaffoldBackgroundColor: ColorManager.jBrownColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorManager.kBrown2Color,
    foregroundColor: ColorManager.kBrown2Color,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: ColorManager.kCreamColor),
    bodyMedium: TextStyle(color: ColorManager.kCreamColor),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: ColorManager.kBrown2Color,
    textTheme: ButtonTextTheme.primary,
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: ColorManager.kWhiteColor,
      backgroundColor: ColorManager.kBrown2Color,
    ),

  ),
progressIndicatorTheme: ProgressIndicatorThemeData(
  circularTrackColor: ColorManager.jCreamColor
) 
);
