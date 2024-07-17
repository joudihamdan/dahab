
import 'package:dahab_clinic_management/screen/Auth/reset_parrword_page.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../const/constant.dart';
import '../../controllers/validation_controller.dart';
import '../../widgets/signup&homepge/app_icon.dart';
import '../../widgets/signup&homepge/code_container.dart';
import '../../widgets/signup&homepge/container_button.dart';

class CodePage extends StatelessWidget {
  const CodePage({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ValidationController validationController = Get.find();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: kBrownColor));
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: GetBuilder<ValidationController>(
                init: ValidationController(),
                builder: (c) => Form(
                  key: validationController.formKeyList[2],
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
                        width: width * 0.81,
                        height: height * 0.50,
                        decoration: kContainerDecoration,
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.aspectRatio),
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.03),
                              Text(
                                  ' We just sent your verification code via the email that you entered ' +
                                      '\n\n' +
                                      'Please enter email verification code',
                                  textAlign: TextAlign.center,
                                  style: kTextStyle.copyWith(
                                      fontSize: height * 0.019)),
                              SizedBox(height: height * 0.04),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CodeContainer(
                                    height: height,
                                    width: width,
                                    controller:
                                        validationController.codeController,
                                    onsaved: (value) {
                                      validationController.code = value!;
                                    },
                                    validator: (value) {
                                      return validationController
                                          .validateCode(value!);
                                    },
                                  ),
                                  CodeContainer(
                                    height: height,
                                    width: width,
                                    controller:
                                        validationController.code1Controller,
                                    onsaved: (value) {
                                      validationController.code = value!;
                                    },
                                    validator: (value) {
                                      return validationController
                                          .validateCode(value!);
                                    },
                                  ),
                                  CodeContainer(
                                    height: height,
                                    width: width,
                                    controller:
                                        validationController.code2Controller,
                                    onsaved: (value) {
                                      validationController.code = value!;
                                    },
                                    validator: (value) {
                                      return validationController
                                          .validateCode(value!);
                                    },
                                  ),
                                  CodeContainer(
                                    height: height,
                                    width: width,
                                    controller:
                                        validationController.code3Controller,
                                    onsaved: (value) {
                                      validationController.code = value!;
                                    },
                                    validator: (value) {
                                      return validationController
                                          .validateCode(value!);
                                    },
                                  ),
                                  CodeContainer(
                                    height: height,
                                    width: width,
                                    controller:
                                        validationController.code4Controller,
                                    onsaved: (value) {
                                      validationController.code = value!;
                                    },
                                    validator: (value) {
                                      return validationController
                                          .validateCode(value!);
                                    },
                                  ),
                                  CodeContainer(
                                    height: height,
                                    width: width,
                                    controller:
                                        validationController.code5Controller,
                                    onsaved: (value) {
                                      validationController.code = value!;
                                    },
                                    validator: (value) {
                                      return validationController
                                          .validateCode(value!);
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: height * 0.02),
                              DelayedDisplay(
                                delay: const Duration(seconds: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Didn\'t receive the code?',
                                        style: kTextStyle.copyWith(
                                            fontSize: height * 0.019,
                                            color: Colors.grey)),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Resend!',
                                          style: kTextStyle.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.019,
                                              color: kBrownColor),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.04),
                              ContainerButton(
                                height: height,
                                width: width,
                                child: TextButton(
                                    onPressed: () async {
                                      // if (validationController
                                      //     .formKeyList[2].currentState!
                                      //     .validate()) {

                                      //   validationController
                                      //       .formKeyList[2].currentState!
                                      //       .save();
                                      // }
                                      Get.to(
                                        () => ReSetPassword(
                                          email: email,
                                          code: '',
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Continue',
                                      style: kTextStyle.copyWith(
                                        fontSize: height * 0.024,
                                        color: Colors.white,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
