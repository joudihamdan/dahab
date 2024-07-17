import 'package:dahab_clinic_management/screen/Auth/auth_page.dart';
import 'package:dahab_clinic_management/screen/category_screen.dart';
import 'package:dahab_clinic_management/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'models/response/category_model.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
       home:AuthPage()
      /*CategoryScreen(
        categoryModel: CategoryModel(
            id: 1,
            name: "Skin care",
            image: "",
            description:
                "kasg kbvewbv jskbvwsjv vbsvb svohsv snv ksvoi ihf osbv is isbv "),
      ),*/
    );
  }
}
