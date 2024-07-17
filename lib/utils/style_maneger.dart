import 'dart:ui';

import 'package:dahab_clinic_management/const/constant.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';

class StyleManager {
  static const TextStyle kAppBar = TextStyle(
      color: kCreamColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Montserrat');

  static TextStyle smallBlackText({
    Color color = ColorManager.blackColor,
    double size = 16,
  }) {
    return TextStyle(
      color: color,
      fontFamily: "Poppins",
      fontSize: size,
    );
  }

  static TextStyle normalText({
    Color color = ColorManager.blackColor,
    double size = 18,
  }) {
    return TextStyle(color: color, fontSize: size, fontFamily: "Poppins");
  }
  
static TextStyle kCardTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Montserrat',
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttunTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
    color: ColorManager.kWhiteColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle headerTextStyle = TextStyle(
    fontFamily: 'Montserrat',
      fontSize: 20,
      color: ColorManager.kBrown2Color,fontWeight: FontWeight.w800
  );

  static ButtonStyle ElevatedButtonStyle= ElevatedButton.styleFrom(
    backgroundColor:
    Color(0xff643624)
        .withOpacity(0.8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    minimumSize: const Size(double.infinity, 50),
  );
}
