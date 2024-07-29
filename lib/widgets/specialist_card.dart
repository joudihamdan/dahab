import 'package:carousel_slider/carousel_slider.dart';
import 'package:dahab_clinic_management/controllers/specialist_controller.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/spacialist_model.dart';
import '../utils/color_manager.dart';

class SpecialistCard extends StatefulWidget {
  const SpecialistCard({super.key, required this.serviceId});
  final int serviceId;

  @override
  State<SpecialistCard> createState() => _SpecialistCardState();
}

class _SpecialistCardState extends State<SpecialistCard> {
  SpecialistController specialistController = Get.put(SpecialistController());

  @override
  void initState() {
    specialistController.getSpecialist(widget.serviceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (specialistController.resultModel.value is ListOf<SpecialistModel>) {
          return Column(children: [
            CarouselSlider.builder(
              itemCount: (specialistController.resultModel.value
                      as ListOf<SpecialistModel>)
                  .resutl
                  .length,
              itemBuilder: (context, index, realindex) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // CircleAvatar(
                    //   backgroundImage: ,
                    //   radius: 50,
                    // ),
                    const SizedBox(height: 8),
                    Text(
                      (specialistController.resultModel.value
                              as ListOf<SpecialistModel>)
                          .resutl[index]
                          .name,
                      style: StyleManager.normalText
                          .copyWith(color: ColorManager.kCreamColor),
                    ),
                    Text(
                      (specialistController.resultModel.value
                              as ListOf<SpecialistModel>)
                          .resutl[index]
                          .description,
                      style: const TextStyle(color: ColorManager.kCreamColor),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: 120,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      specialistController.setSelectedIndex(index);
                      print("oiiiiii ${specialistController.selectedIndex.value}");
                    },
                  );
                },
              ),
            ),
            AnimatedSmoothIndicator(
              effect: const ExpandingDotsEffect(
                  dotWidth: 10,
                  activeDotColor: ColorManager.kCreamColor,
                  dotHeight: 5),
              activeIndex: specialistController.selectedIndex.value,
              count: (specialistController.resultModel.value
                      as ListOf<SpecialistModel>)
                  .resutl
                  .length,
            ),
          ]);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
