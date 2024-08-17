import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';

Icon barIcon(BuildContext context, IconData icon, bool currentindex) {
  return Icon(
    icon,
    color: Theme.of(context).brightness == Brightness.dark
        ? currentindex
            ? ColorManager.kWhiteColor
            : ColorManager.kWhiteColor
        : currentindex
            ? ColorManager.kCoffeeColor
            : ColorManager.kWhiteColor,
    size: MediaQuery.of(context).size.height * 0.035,
  );
}
