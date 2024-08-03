import 'package:dahab_clinic_management/screen/service_screen.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {super.key, required this.image, required this.name, required this.id, required this.cat_id});
  final int cat_id;
  final String image;
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => ServiceScreen(id: id,cat_id:cat_id));
          },
          child: Card(
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
                        image: Image.network(
                          image,
                          errorBuilder: (context, error, stackTrace) =>
                              const FlutterLogo(),
                        ).image,
                        fit: BoxFit.fill),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: ColorManager.jBrownColor),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
