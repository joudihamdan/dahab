
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../const/constant.dart';
import '../../controllers/validation_controller.dart';
import '../../widgets/signup&homepge/app_icon.dart';
import '../../widgets/signup&homepge/container_button.dart';
import '../../widgets/signup&homepge/text_field_container.dart';
import 'code_page.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValidationController validationController = Get.find();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kBrownColor,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.110),
              Stack(alignment: Alignment.center, children: [
                appIcon(),
                Positioned(
                  top: 150,
                  child: Text('Reset Password',
                      style: kTextStyle.copyWith(fontSize: 35)),
                ),
              ]),
              SizedBox(height: height * 0.05),
              Container(
                width: width * 0.80,
                height: height * 0.45,
                decoration: kContainerDecoration,
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.aspectRatio),
                  child: GetBuilder<ValidationController>(
                    init: ValidationController(),
                    builder: (controller) => Form(
                      key: controller.formKeyList[1],
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.02),
                          Text(
                            'Enter your Email\n to send a verification code',
                            style: kTextStyle,
                            textAlign: TextAlign.center,
                          ),
                          Image(
                              image: const AssetImage('assets/images/googleIcon.png'),
                              width: width * 0.1,
                              height: height * 0.1),
                          SizedBox(height: height * 0.010),
                          TextFieldContainer(
                            text: 'Email'.tr,
                            type: TextInputType.emailAddress,
                            obsecure: false,
                            controller: controller.email2Controller,
                            onsaved: (value) {
                              controller.email = value!;
                            },
                            validator: (value) {
                              return controller.validateEmail(value!);
                            },
                          ),
                          SizedBox(height: height * 0.1),
                          ContainerButton(
                            height: height,
                            width: width,
                            child: TextButton(
                                onPressed: () async {
                                  if (controller.formKeyList[1].currentState!
                                      .validate()) {
                                    controller.formKeyList[1].currentState!
                                        .save();
                                  }
                                  Get.to(
                                      () => CodePage(
                                            email: validationController
                                                .email2Controller.text,
                                          ),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 1500));
                                },
                                child: Text(
                                  'Send Code',
                                  style: kTextStyle.copyWith(
                                    fontSize: 22,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
