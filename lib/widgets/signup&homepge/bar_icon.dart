import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';

import '../../const/constant.dart';

Icon barIcon(BuildContext context, IconData icon ,bool currentindex) {
  return Icon(
    icon,
    color: currentindex? ColorManager.kCoffeeColor : ColorManager.kWhiteColor,
    size: MediaQuery.of(context).size.height * 0.035,
  );
}