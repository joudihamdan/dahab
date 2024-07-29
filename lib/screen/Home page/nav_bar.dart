import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dahab_clinic_management/screen/Home%20page/profile.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../const/constant.dart';
import '../../controllers/update_controller.dart';
import '../../widgets/signup&homepge/bar_icon.dart';
import 'sessions_screen.dart';
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
              SessionsScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 55,
            color: kCoffeeColor,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? ColorManager.jBrownColor
                : Color(0xffFEF3EC),  
            buttonBackgroundColor: ColorManager.kWhiteColor,
            onTap: controller.changeTabIndex,
            animationCurve: Curves.linear,
            index: controller.tabIndex,
            items: [
              barIcon(
                  context, FontAwesomeIcons.house, (controller.tabIndex == 0)),
              barIcon(context, FontAwesomeIcons.artstation,
                  (controller.tabIndex == 1)),
              barIcon(context, Icons.layers_sharp, (controller.tabIndex == 2)),
              barIcon(context, Icons.person, (controller.tabIndex == 3)),
            ],
          ),
        );
      }),
    );
  }
}
