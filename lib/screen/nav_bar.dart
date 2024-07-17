
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dahab_clinic_management/screen/book_screen.dart';
import 'package:dahab_clinic_management/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../const/constant.dart';
import '../controllers/update_controller.dart';
import '../widgets/signup&homepge/bar_icon.dart';
import 'Auth/sessions_screen.dart';
import 'gallery.dart';
import 'home_page.dart';

class NavigationsBar extends StatelessWidget {
  const NavigationsBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateController>(
      init: UpdateController(),
      builder: ((controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              const HomePage(),
              const Gallery(),
              const SessionsScreen(),
              const Profile(),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 55,
            color: Colors.white,
            backgroundColor: kCoffeeColor,
            buttonBackgroundColor: kCreamColor,
            onTap: controller.changeTabIndex,
            animationCurve: Curves.linear,
            index: controller.tabIndex,
            items: [
              barIcon(context, FontAwesomeIcons.house),
              barIcon(context, FontAwesomeIcons.artstation),
              barIcon(context, Icons.layers_sharp),
              barIcon(context, Icons.person),
            ],
          ),
        );
      }),
    );
  }
}
