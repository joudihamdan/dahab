import 'package:dahab_clinic_management/models/service_model.dart';
import 'package:dahab_clinic_management/screen/service_screen.dart';
import 'package:dahab_clinic_management/utils/assets_manager.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceScreen(
              serviceModel:
              ServiceModel(
                  name: "Lasre",
                  image: AssetsManager.testImg,
                  description:
                      "too long description andd isvb isc kihv ksvb iskv sv shkls isv uikfg ig iusgc u sfj usfw uif gadls ufdwdifkwf wfwvebbbeebeb dbeb ebebev ",
                  price: 4000),
            ),
          ),
        );
      },

        child: Stack(
          children: [
            Card(
           color: ColorManager.jCreamColor.withOpacity(0.8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 155,
                    height: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image:  DecorationImage(
                          image: AssetImage(image),
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
                                    Color(0xffE1C5AF).withOpacity(0.6),
                                    const Color(0xff7B6C5F).withOpacity(0.1),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("neven",style: TextStyle(color: ColorManager.jBrownColor),),
                  )
                ],
              ),
                  
            )


          ],
    )

    );
  }
}
