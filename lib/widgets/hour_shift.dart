import 'package:dahab_clinic_management/controllers/reversation_controller.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/shift_time_model.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HourShift extends StatelessWidget {
  const HourShift({
    super.key,
    required this.reversationController,
    required this.length,
    required this.offer,
  });

  final ReversationController reversationController;
  final int length;
  final bool offer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
        height: 100,
        child: Center(
          child: GridView.builder(
            itemCount: length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  reversationController.onTimeSelected(index);
                },
                child: Obx(
                  () => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              reversationController.currentIndex.value == index
                                  ? ColorManager.kBrownColor
                                  : ColorManager.kWhiteColor,
                                  
                        ),
                        color: reversationController.currentIndex.value == index
                            ? ColorManager.kBrownColor
                            : null),
                      
                    child: Center(
                      child: Text(
                        offer
                            ?(reversationController.offertimeResult.value as ListSt)
                                .resutl[index]
                            : (reversationController.timeResult.value
                                    as ListOf<ShiftTimeModel>)
                                .resutl[index]
                                .time
                            ,
                        style: TextStyle(
                            fontSize: 12,
                            color: reversationController.currentIndex.value ==
                                    index
                                ? ColorManager.jBrownColor
                                : ColorManager.blackColor),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
