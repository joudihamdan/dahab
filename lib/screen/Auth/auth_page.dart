
import 'package:dahab_clinic_management/screen/Home%20page/home_page.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../const/constant.dart';
import '../../controllers/validation_controller.dart';
import '../../widgets/signup&homepge/app_icon.dart';
import '../../widgets/signup&homepge/container_button.dart';
import '../../widgets/signup&homepge/text_field_container.dart';
import '../Home page/nav_bar.dart';
import 'forget_password_page.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  bool hasAccount = true;
  late bool asVisiter;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height * 0.40,
            decoration: kDecoration,
          ),
          GetBuilder<ValidationController>(
            init: ValidationController(),
            builder: (controller) => SingleChildScrollView(
              child: Form(
                key: controller.formKeyList[0],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.05),
                      Stack(alignment: Alignment.center, children: [
                        appIcon(),
                        Positioned(
                          top: 150,
                          child: DelayedDisplay(
                              delay: Duration(seconds: 3),
                              child: const Text('Dahab Beauty Clinic',
                                  style: kAppName)),
                        ),
                      ]),
                      SizedBox(height: height * 0.03),
                      Center(
                        child: AnimatedContainer(
                          curve: Curves.linear,
                          duration: const Duration(milliseconds: 1000),
                          padding: EdgeInsets.all(height * 0.01),
                          width: width * 0.85,
                          height: hasAccount ? height * 0.52 : height * 0.585,
                          decoration: kContainerDecoration,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  hasAccount
                                      ? Icons.person_rounded
                                      : Icons.person_add_rounded,
                                  color: kCoffeeColor,
                                  size: height * 0.045,
                                ),
                                SizedBox(
                                    height: hasAccount
                                        ? height * 0.005
                                        : height * 0.015),
                                hasAccount
                                    ? const SizedBox()
                                    : TextFieldContainer(
                                        text: 'Name',
                                        type: TextInputType.name,
                                        obsecure: false,
                                        controller: controller.nameController,
                                        onsaved: (value) {
                                          controller.name = value!;
                                        },
                                        validator: (value) {
                                          return controller
                                              .validateName(value!);
                                        },
                                      ),
                                SizedBox(
                                    height: hasAccount
                                        ? height * 0.015
                                        : height * 0.015),
                                hasAccount
                                    ? TextFieldContainer(
                                        text: 'Email',
                                        type: TextInputType.emailAddress,
                                        obsecure: false,
                                        controller: controller.emailController,
                                        onsaved: (value) {
                                          controller.email = value!;
                                        },
                                        validator: (value) {
                                          return controller
                                              .validateEmail(value!);
                                        },
                                      )
                                    : TextFieldContainer(
                                        text: 'Email',
                                        type: TextInputType.emailAddress,
                                        obsecure: false,
                                        controller: controller.email1Controller,
                                        onsaved: (value) {
                                          controller.email = value!;
                                        },
                                        validator: (value) {
                                          return controller
                                              .validateEmail(value!);
                                        },
                                      ),
                                SizedBox(
                                    height: hasAccount
                                        ? height * 0.028
                                        : height * 0.015),
                                hasAccount
                                    ? Obx(
                                        () => TextFieldContainer(
                                          text: 'Passsword',
                                          type: TextInputType.visiblePassword,
                                          obsecure:
                                              controller.isPasswordHidden.value,
                                          controller:
                                              controller.passwordController,
                                          icon: IconButton(
                                            icon: Icon(
                                              controller.isPasswordHidden.value
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: kCoffeeColor,
                                            ),
                                            onPressed: () {
                                              controller
                                                      .isPasswordHidden.value =
                                                  !controller
                                                      .isPasswordHidden.value;
                                            },
                                          ),
                                          onsaved: (value) {
                                            controller.password = value!;
                                          },
                                          validator: (value) {
                                            return controller
                                                .validatePassword(value!);
                                          },
                                        ),
                                      )
                                    : Obx(
                                        () => TextFieldContainer(
                                          text: 'Password',
                                          type: TextInputType.visiblePassword,
                                          obsecure:
                                              controller.isPasswordHidden.value,
                                          controller:
                                              controller.signpasswordController,
                                          icon: IconButton(
                                            icon: Icon(
                                              controller.isPasswordHidden.value
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: kCoffeeColor,
                                            ),
                                            onPressed: () {
                                              controller
                                                      .isPasswordHidden.value =
                                                  !controller
                                                      .isPasswordHidden.value;
                                            },
                                          ),
                                          onsaved: (value) {
                                            controller.password = value!;
                                          },
                                          validator: (value) {
                                            return controller
                                                .validatePassword(value!);
                                          },
                                        ),
                                      ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(
                                      () => const ForgetPasswordPage(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                    );
                                  },
                                  child: hasAccount
                                      ? Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            'Forget Password?',
                                            style: kTextStyle.copyWith(
                                              fontSize: 13,
                                                decoration:
                                                    TextDecoration.underline),
                                          ))
                                      : TextFieldContainer(
                                          text: 'Confirm Password',
                                          type: TextInputType.visiblePassword,
                                          obsecure: true,
                                          validator: (val) {
                                            if (val.isEmpty) {
                                              return 'Please Confirm your Password';
                                            } else if (val !=
                                                controller
                                                    .signpasswordController
                                                    .text) {
                                              return 'Confirming Must be the same as above';
                                            }
                                          },
                                        ),
                                ),
                                SizedBox(height: height * 0.02),
                                ContainerButton(
                                  height: height,
                                  width: width,
                                  child: TextButton(
                                      onPressed: () async {
                                        Get.off(()=> const NavigationsBar());
                                        if (hasAccount) {
                                          if (controller
                                              .formKeyList[0].currentState!
                                              .validate()) {
                                            asVisiter = false;
                                            controller
                                                .formKeyList[0].currentState!
                                                .save();
                                          }
                                        } else {
                                          asVisiter = false;
                                          if (controller
                                              .formKeyList[0].currentState!
                                              .validate()) {
                                            controller
                                                .formKeyList[0].currentState!
                                                .save();
                                            //TODO: adding action
                                          }
                                        }
                                      },
                                      child: Text(
                                        hasAccount ? 'Sign In' : 'Sign Up',
                                        style: kTextStyle.copyWith(
                                          fontSize: height * 0.028,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                SizedBox(height: height * 0.012),
                                Text(
                                    hasAccount
                                        ? ' - Or Sign In By - '
                                        : '- Or Sign Up By - ',
                                    style: kTextStyle.copyWith(
                                        fontSize: height * 0.02,
                                        color: Colors.grey)),
                                SizedBox(height: height * 0.012),
                                FacebookButton(
                                    height: height,
                                    width: width,
                                    onpressed: () {
                                      if (hasAccount) {
                                      } else {
                                        //TODO: facebook action
                                      }
                                    }),
                                hasAccount
                                    ? SizedBox(height: height * 0.005)
                                    : SizedBox(),
                                hasAccount
                                    ? TextButton(
                                        onPressed: () async {
                                          // bool result =
                                          //     await InternetConnectionChecker()
                                          //         .hasConnection;
                                          asVisiter = true;
                                          //TODO: adding action
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Enter As a Visitor',
                                              style: kTextStyle.copyWith(
                                                fontSize: 16,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: kCoffeeColor)),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      hasAccount
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don\'t have an account?',
                                    style: kTextStyle.copyWith(
                                        color: Colors.grey)),
                                TextButton(
                                    onPressed: () {
                                      hasAccount = false;
                                      controller.update();
                                    },
                                    child: Text(
                                      'Sign Up!',
                                      style: kTextStyle.copyWith(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w900,
                                          color: kBrownColor),
                                    ))
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account?',
                                    style: kTextStyle.copyWith(
                                        color: Colors.grey)),
                                TextButton(
                                    onPressed: () {
                                      hasAccount = true;
                                      controller.update();
                                    },
                                    child: Text(
                                      'Sign In!'.tr,
                                      style: kTextStyle.copyWith(
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w900,
                                          color: kBrownColor),
                                    ))
                              ],
                            ),
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
