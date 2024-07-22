import 'package:dahab_clinic_management/screen/Auth/auth_page.dart';
import 'package:dahab_clinic_management/screen/Home%20page/home_page.dart';
import 'package:dahab_clinic_management/screen/Home%20page/nav_bar.dart';
import 'package:dahab_clinic_management/screen/Home%20page/profile.dart';
import 'package:dahab_clinic_management/screen/Home%20page/sessions_screen.dart';
import 'package:dahab_clinic_management/screen/book_screen.dart';
import 'package:dahab_clinic_management/screen/category_screen.dart';
import 'package:dahab_clinic_management/screen/service_screen.dart';
import 'package:dahab_clinic_management/services/category_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'models/response/category_model.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
       home:BookScreen()

    );
  }
}
