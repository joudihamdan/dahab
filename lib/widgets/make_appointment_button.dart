import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../screen/Home page/nav_bar.dart';
import '../utils/style_maneger.dart';

class MakeAppointmentButton extends StatelessWidget {
  const MakeAppointmentButton({super.key, required this.timeSelectd});

  final bool timeSelectd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

    width: double.infinity,
    child:
    ElevatedButton(
    onPressed: timeSelectd ?
    () {
      _showConfirmReversationDialog();
    } : null,
    style: StyleManager.ElevatedButtonStyle,
    child: Text("Make Appointment",
    style: StyleManager.buttunTextStyle,),
    )
    );
  }
}

_showConfirmReversationDialog(){
  Get.dialog(
      Dialog(
        backgroundColor: ColorManager.jCreamColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Thank you for your reservation ',style: StyleManager.normalText.copyWith(color: ColorManager.jBrownColor,fontWeight: FontWeight.bold,fontSize: 20
              )),
              SizedBox(height: 16.0),
              Text('You will soon receive a notification when your appointment reservation is confirmed',style: StyleManager.normalText.copyWith(color: Colors.brown)),
              SizedBox(height: 20.0),

              ElevatedButton(
                style: StyleManager.ElevatedButtonStyle,
                onPressed: () {
                  Get.offAll(()=>NavigationsBar());
                },
                child: Text('ok',style: StyleManager.buttunTextStyle,),
              ),
            ],
          ),
        ),
      )
  );
}