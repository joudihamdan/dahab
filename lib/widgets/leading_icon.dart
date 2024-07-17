import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded,
            size: 16, color: ColorManager.kWhiteColor));
  }
}
