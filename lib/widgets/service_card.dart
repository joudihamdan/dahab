import 'package:dahab_clinic_management/models/service_model.dart';
import 'package:dahab_clinic_management/screen/service_screen.dart';
import 'package:dahab_clinic_management/utils/assets_manager.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.image, required this.name,required this.id});
  final String image;
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>  ServiceScreen(id: id));
      },
      child: Stack(
        children: [
          Card(
            color: ColorManager.jCreamColor.withOpacity(0.8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 160,
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill),
                  ),
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            const Color(0xffE1C5AF).withOpacity(0.6),
                            const Color(0xff7B6C5F).withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    name,
                    style: TextStyle(color: ColorManager.jBrownColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
