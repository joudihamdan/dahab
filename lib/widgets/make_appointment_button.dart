import 'package:dahab_clinic_management/controllers/reversation_controller.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/Home page/nav_bar.dart';
import '../utils/style_maneger.dart';

// ignore: must_be_immutable
class MakeAppointmentButton extends StatelessWidget {
  MakeAppointmentButton({super.key, required this.timeSelectd, required this.timeId});
  
  ReversationController reversationController =
      Get.put(ReversationController());

  final bool timeSelectd;
  final int timeId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: timeSelectd
            ? () {
                  reversationController.bookAppointment(timeId);
                showConfirmReversationDialog();
              }
            : null,
        style: StyleManager.ElevatedButtonStyle,
        child: Text(
          "Make Appointment",
          style: StyleManager.buttunTextStyle,
        ),
      ),
    );
  }
}

showConfirmReversationDialog() {
  Get.dialog(Dialog(
    backgroundColor: ColorManager.jCreamColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text('Thank you for your reservation ',
                textAlign: TextAlign.center,
                style: StyleManager.normalText.copyWith(
                    color: ColorManager.jBrownColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
          ),
          const SizedBox(height: 16.0),
          Text(
              'You will soon receive a notification when your appointment is confirmed',
              style: StyleManager.normalText.copyWith(color: Colors.brown)),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: StyleManager.ElevatedButtonStyle,
            onPressed: () {
              Get.offAll(() => const NavigationsBar());
            },
            child: Text(
              'ok',
              style: StyleManager.buttunTextStyle,
            ),
          ),
        ],
      ),
    ),
  ));
}
