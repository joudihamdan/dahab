
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../const/constant.dart';
import '../../controllers/validation_controller.dart';
import '../../widgets/signup&homepge/app_icon.dart';
import '../../widgets/signup&homepge/container_button.dart';
import '../../widgets/signup&homepge/text_field_container.dart';
import 'auth_page.dart';

class ReSetPassword extends StatelessWidget {
  ReSetPassword({required this.email, required this.code});
  String code;
  String email;

  @override
  Widget build(BuildContext context) {
    ValidationController validationController = Get.find();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: kBrownColor));
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.110),
                Stack(alignment: Alignment.center, children: [
                  appIcon(),
                  Positioned(
                    top: 160,
                    child: Text('Reset Password',
                        style: kTextStyle.copyWith(fontSize: 35)),
                  ),
                ]),
                SizedBox(height: height * 0.04),
                Container(
                  width: width * 0.80,
                  height: height * 0.45,
                  decoration: kContainerDecoration,
                  child: GetBuilder<ValidationController>(
                    init: ValidationController(),
                    builder: (controller) => Form(
                      key: controller.formKeyList[3],
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.03),
                          Text(
                            'Please reset a new password',
                            style: kTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: height * 0.04),
                          Obx(
                            () => TextFieldContainer(
                              text: 'Password',
                              type: TextInputType.visiblePassword,
                              obsecure: controller.isPasswordHidden.value,
                              controller: controller.resetPasswordController,
                              icon: IconButton(
                                icon: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: kCoffeeColor,
                                ),
                                onPressed: () {
                                  controller.isPasswordHidden.value =
                                      !controller.isPasswordHidden.value;
                                },
                              ),
                              onsaved: (value) {
                                controller.password = value!;
                              },
                              validator: (value) {
                                return controller.validatePassword(value!);
                              },
                            ),
                          ),
                          SizedBox(height: height * 0.020),
                          TextFieldContainer(
                            text: 'Confirm Password',
                            type: TextInputType.visiblePassword,
                            obsecure: true,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please confirm your password';
                              } else if (val !=
                                  controller.resetPasswordController.text) {
                                return 'Confirming password must be the same as above';
                              }
                            },
                          ),
                          SizedBox(height: height * 0.06),
                          ContainerButton(
                            height: height,
                            width: width,
                            child: TextButton(
                              onPressed: () async {
                                if (controller.formKeyList[3].currentState!
                                    .validate()) {
                                  controller.formKeyList[3].currentState!
                                      .save();
                                  Get.to(() => AuthPage(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 1500));
                                }
                              },
                              child: Text(
                                'Continue',
                                style: kTextStyle.copyWith(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
