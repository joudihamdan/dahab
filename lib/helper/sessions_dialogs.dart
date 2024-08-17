import 'package:dahab_clinic_management/controllers/sessions_controller.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/review_service.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GlobalKey<FormState> formState = GlobalKey();
TextEditingController reviewController = TextEditingController();

showReviewDialog(int sessionId) {
  Get.dialog(
    SizedBox(
      width: double.infinity,
      child: Dialog(
        backgroundColor: ColorManager.jCreamColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'add your review here please',
                style: StyleManager.normalText.copyWith(
                    color: ColorManager.jBrownColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: Form(
                      key: formState,
                      child: TextFormField(
                        controller: reviewController,
                        validator: (Value) {
                          if (Value!.isEmpty) {
                            return "can't submit empty review";
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: ColorManager.jBrownColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: ColorManager.jBrownColor)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                  style: StyleManager.ElevatedButtonStyle.copyWith(
                      minimumSize: const WidgetStatePropertyAll(Size(100, 40))),
                  onPressed: () {
                    final String reviewtext = reviewController.text;
                    if (reviewtext.isNotEmpty) {
                      ReviewService().addReview(sessionId, reviewtext);
                      reviewController.clear();
                      Get.back();
                      Get.snackbar('Thanks!', 'Review added successfully');
                    } else {
                      Get.snackbar('Error', 'Please fill all fields');
                    }
                  },
                  child: Text(
                    "Go",
                    style: StyleManager.buttunTextStyle,
                  ))
            ],
          ),
        ),
      ),
    ),
  );
}

showThanksDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: ColorManager.jCreamColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Text(
          'Thanks for your Comment',
          textAlign: TextAlign.center,
          style: StyleManager.normalText.copyWith(
              color: ColorManager.jBrownColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    ),
  );
}

showConfirmDeleteReservationDialog(int id) {
  SessionsController sessionsController = Get.put(SessionsController());
  Get.dialog(
    Dialog(
      backgroundColor: ColorManager.jCreamColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Are you sure you want to cancel your reservation ?',
                style: StyleManager.normalText.copyWith(
                    color: ColorManager.jBrownColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: StyleManager.ElevatedButtonStyle.copyWith(
                    minimumSize: const WidgetStatePropertyAll(
                      Size(60, 20),
                    ),
                  ),
                  onPressed: () {
                    sessionsController.deleteSession(id);
                    Get.back();
                    // print(sessionsController.deleteUpdateRes.value);
                    // if (sessionsController.deleteUpdateRes.value is SuccessResult) {
                      
                    //   Get.snackbar(
                    //       "Successfully", "your session delete successfully");
                    // } else {
                    //   Get.snackbar(
                    //       colorText: Colors.red,
                    //       "failes",
                    //       "your session hasn't deleted try again ");
                    // }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'Yes',
                      style: StyleManager.buttunTextStyle,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: StyleManager.ElevatedButtonStyle.copyWith(
                    minimumSize: const WidgetStatePropertyAll(
                      Size(40, 15),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Cancel',
                    style: StyleManager.buttunTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
