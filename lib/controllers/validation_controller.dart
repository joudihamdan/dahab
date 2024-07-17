import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationController extends GetxController {
  bool loder = false;
  final List<GlobalObjectKey<FormState>> formKeyList =
      List.generate(10, (index) => GlobalObjectKey<FormState>(index));
  // final GlobalObjectKey<FormState> loginFormKey = GlobalObjectKey<FormState>();
  // final GlobalObjectKey<FormState> emailFormKey = GlobalObjectKey<FormState>();

  // final GlobalObjectKey<FormState> codeformKey = GlobalObjectKey<FormState>();
  // final GlobalObjectKey<FormState> passformKey = GlobalObjectKey<FormState>();
  // final GlobalObjectKey<FormState> resetPassformKey = GlobalObjectKey<FormState>();

  // final GlobalObjectKey<FormState> resetformKey = GlobalObjectKey<FormState>();
  // final GlobalObjectKey<FormState> birthformKey = GlobalObjectKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController email1Controller;
  late TextEditingController email2Controller;
  late TextEditingController passwordController;
  late TextEditingController oldPasswordController;

  late TextEditingController signpasswordController;
  late TextEditingController resetPasswordController;
  late TextEditingController settingPasswordController;
  late TextEditingController nameController;

  late TextEditingController codeController;
  late TextEditingController code1Controller;
  late TextEditingController code2Controller;
  late TextEditingController code3Controller;
  late TextEditingController code4Controller;
  late TextEditingController code5Controller;
  late TextEditingController resetController;

  late TextEditingController birthDateController;
  late TextEditingController editBirthDateController;
  late TextEditingController editNameController;
  late TextEditingController editWeightController;

  var email = '';
  var password = '';
  var name = '';
  var code = '';
  var reset = '';
  var birthDate = '';
  var editBirthDate = '';
  var editname = '';
  var editwweight = '';
  var oldPass = '';

  var isPasswordHidden = true.obs;

  @override
  void onInit() async {
    super.onInit();
    resetController = TextEditingController();
    emailController = TextEditingController();
    email1Controller = TextEditingController();
    email2Controller = TextEditingController();

    passwordController = TextEditingController();
    signpasswordController = TextEditingController();
    resetPasswordController = TextEditingController();
    oldPasswordController = TextEditingController();
    settingPasswordController = TextEditingController();
    nameController = TextEditingController();

    codeController = TextEditingController();
    code1Controller = TextEditingController();
    code2Controller = TextEditingController();
    code3Controller = TextEditingController();
    code4Controller = TextEditingController();
    code5Controller = TextEditingController();

    editNameController = TextEditingController();
    // editNameController.text = await shared.getname();
    birthDateController = TextEditingController();
    // birthDateController.text = await shared.getbirthdate();
    editBirthDateController = TextEditingController();
    editWeightController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    email1Controller.dispose();
    email2Controller.dispose();
    passwordController.dispose();
    oldPasswordController.dispose();
    signpasswordController.dispose();
    resetPasswordController.dispose();
    settingPasswordController.dispose();
    nameController.dispose();
    codeController.dispose();
    resetController.dispose();
    birthDateController.dispose();
    codeController.dispose();
    code1Controller.dispose();
    code2Controller.dispose();
    code3Controller.dispose();
    code4Controller.dispose();
    code5Controller.dispose();
    editNameController.dispose();
    editBirthDateController.dispose();
    editWeightController.dispose();
    formKeyList;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)
        // ||
        //     RegExp(r"^[a-z A-Z 0-9.a-z A-Z 0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z A-Z 0-9]+\.[a-z A-Z]")
        //         .hasMatch(value)
        ) {
      return 'Please Enter a Valid Email.';
    }
    return null;
  }

  String? validateResetPassword(String value) {
    if (value.length < 8) {
      return 'Password Must Be More Than 8 Charecters'.tr;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return 'Password Must Be More Than 8 Charecters'.tr;
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty || value.length < 3) {
      return 'Please Enter Your Name'.tr;
    }
    return null;
  }

  String? validateCode(String value) {
    if (value.isEmpty) {
      return '-';
    }
    return null;
  }


}
