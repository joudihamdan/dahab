import 'package:dahab_clinic_management/controllers/reversation_controller.dart';
import 'package:dahab_clinic_management/controllers/specialist_controller.dart';
import 'package:dahab_clinic_management/helper/date_formate.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/shift_time_model.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildHoursShift extends StatefulWidget {
  const BuildHoursShift({super.key, required this.id});
  final int id;

  @override
  State<BuildHoursShift> createState() => _BuildHoursShiftState();
}

class _BuildHoursShiftState extends State<BuildHoursShift> {
  SpecialistController specialistController = Get.put(SpecialistController());
  ReversationController reversationController =
      Get.put(ReversationController());
  @override
  void initState() {
    specialistController.getSpecialist(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ReversationController reversationController = Get.find();
    reversationController.getShiftTimesByDate(
        widget.id,
        (specialistController
            .getSpecialistId(specialistController.selectedIndex.value + 1)),
        formatDate(reversationController.focusedDay.value));
    return Obx(
      () {
        if (reversationController.timeResult.value is ListOf<ShiftTimeModel>) {
          return SizedBox(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: GridView.builder(
                  itemCount: (reversationController.timeResult.value
                          as ListOf<ShiftTimeModel>)
                      .resutl
                      .length,
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
                                    reversationController.currentIndex.value ==
                                            index
                                        ? ColorManager.kBrownColor
                                        : ColorManager.kWhiteColor,
                              ),
                              color: reversationController.currentIndex.value ==
                                      index
                                  ? ColorManager.kBrownColor
                                  : null),
                          child: Center(
                            child: Text(
                              (reversationController.timeResult.value
                                      as ListOf<ShiftTimeModel>)
                                  .resutl[index]
                                  .time,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: reversationController
                                              .currentIndex.value ==
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
        } else if (reversationController.resultModel.value is EmptyResult) {
          return const Center(
            child: Text("emty"),
          );
        } else if (reversationController.resultModel.value is ExceptionResult) {
          return const Center(
            child: Text("Oops there is something wrong"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
