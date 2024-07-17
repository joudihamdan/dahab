import 'package:flutter/material.dart';

class ScreenSizeUtil {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  static double dynamicWidth(double value) {
    return screenWidth * value;
  }

  static double dynamicHeight(double value) {
    return screenHeight * value;
  }
}
