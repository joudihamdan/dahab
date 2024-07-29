import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.kBrownColor,
        leading: const LeadingIcon(),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Lottie.asset('assets/lottie/nodata.json'),
        ),
      ),
    );
  }
}
