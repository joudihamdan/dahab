import 'package:dahab_clinic_management/controllers/profile_controller.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final _controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
            return Scaffold(
            //  backgroundColor: ColorManager.kCoffeeColor,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: AppBar(
                  backgroundColor: ColorManager.kCoffeeColor,
                   title: Text(_controller.name.value,style: StyleManager.kAppBar),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(_controller.isDarkMode.value ? Icons.dark_mode : Icons.light_mode),
                        onPressed: _controller.toggleTheme,
                      ),
                    ),
                  ],
                ),
              ),
              body: Container(
                decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(25)),
                  color: Color(0xffFEF3EC),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 15,),
                    //   child: Text(_controller.name.value,style: StyleManager.kAppBar),
                    // ),
                    SizedBox(height: 16.0),
                    ListTile(
                      title: Text('Language'),
                      leading: Icon(Icons.language_outlined),
                      trailing: DropdownButton<String>(
                        value: _controller.selectedLanguage.value,
                        onChanged: _controller.changeLanguage,
                        items: [
                          DropdownMenuItem(value: 'ar', child: Text('Arabic')),
                          DropdownMenuItem(value: 'en', child: Text('English')),
                        ],
                        dropdownColor: Theme.of(context).colorScheme.surface,
                        elevation: 8,
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    SizedBox(height: 20,),
                    const ListTile(
                      title: Text("Rate us",style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: ColorManager.jBrownColor ),),
                      leading: Icon(Icons.star_rate_outlined,size: 25,),
                    ),
                    SizedBox(height: 20,),
                    const ListTile(
                      title: Text("Log out",style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: ColorManager.jBrownColor ),),
                      leading: Icon(Icons.login_outlined,size: 25,),
                    ),
                  ],
                ),
              ),
            );
          }
    );
  }
}