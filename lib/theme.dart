import 'package:flutter/material.dart';

// Light Theme Colors
const kBrownColor = Color(0xffAD8B73);
const kBrown2Color = Color(0xff93583F);
const jBrownColor = Color(0xff4D3529);
const kBeigeColor = Color(0xffE3CAA5);
const kCoffeeColor = Color(0xffCEAB93);
const kCreamColor = Color(0xffFFFBE9);
const jCreamColor = Color(0xffECCFB8);
const blackColor = Color.fromARGB(255, 0, 0, 0);
const kWhiteColor = Color.fromARGB(255, 255, 255, 255);

// Dark Theme Colors
const kBrownColorDark = Color(0xff5D4637);
const kBrown2ColorDark = Color(0xff4A2D21);
const jBrownColorDark = Color(0xff2D1B13);
const kBeigeColorDark = Color(0xffA28B6A);
const kCoffeeColorDark = Color(0xff7C5F4D);
const kCreamColorDark = Color(0xff635246);
const jCreamColorDark = Color(0xff7C6A59);
const blackColorDark = Color.fromARGB(255, 255, 255, 255);
const kWhiteColorDark = Color.fromARGB(255, 0, 0, 0);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kBrownColor,
  colorScheme: const ColorScheme.light(
    primary: kBrownColor,
    secondary: kBeigeColor,
    background: kWhiteColor,
    surface: kCreamColor,
    onPrimary: blackColor,
    onSecondary: blackColor,
    onBackground: blackColor,
    onSurface: blackColor,
  ),
  scaffoldBackgroundColor: const Color(0xffFEF3EC),
  appBarTheme: const AppBarTheme(
    backgroundColor: kBrown2Color,
    iconTheme: IconThemeData(color: kCreamColor),
    titleTextStyle: TextStyle(
      color: kCreamColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: blackColor),
    bodyMedium: TextStyle(color: blackColor),
    headlineMedium: TextStyle(color: blackColor),
    headlineSmall: TextStyle(color: blackColor),
    titleLarge: TextStyle(color: blackColor),
    titleMedium: TextStyle(color: blackColor),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: kCoffeeColor,
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kBrownColor,
  ),
  iconTheme: const IconThemeData(color: blackColor),
);



final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kBrownColorDark,
  colorScheme: const ColorScheme.dark(
    primary: kBrownColorDark,
    secondary: kBeigeColorDark,
    background: kWhiteColorDark,
    surface: kCreamColorDark,
    onPrimary: blackColorDark,
    onSecondary: blackColorDark,
    onBackground: blackColorDark,
    onSurface: blackColorDark,
  ),
  scaffoldBackgroundColor:blackColor ,
  appBarTheme: const AppBarTheme(
    backgroundColor: kBrown2ColorDark,
    iconTheme: IconThemeData(color: blackColorDark),
    titleTextStyle: TextStyle(
      color: blackColorDark,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: blackColorDark),
    bodyMedium: TextStyle(color: blackColorDark),
    headlineMedium: TextStyle(color: blackColorDark),
    headlineSmall: TextStyle(color: blackColorDark),
    titleLarge: TextStyle(color: blackColorDark),
    titleMedium: TextStyle(color: blackColorDark),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: kCoffeeColorDark,
    textTheme: ButtonTextTheme.primary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kBrownColorDark,
  ),
  iconTheme: const IconThemeData(color: blackColorDark),
);
