import 'package:dahab_clinic_management/controllers/reversation_controller.dart';
import 'package:dahab_clinic_management/controllers/sessions_controller.dart';
import 'package:dahab_clinic_management/controllers/specialist_controller.dart';
import 'package:dahab_clinic_management/helper/date_formate.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/sessions_model.dart';
import 'package:dahab_clinic_management/models/shift_time_model.dart';
import 'package:dahab_clinic_management/models/spacialist_model.dart';
import 'package:dahab_clinic_management/screen/global/no_data_screen.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/build_table_calendare.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/non_valid_date.dart';
import 'package:dahab_clinic_management/widgets/hour_shift.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/widgets/make_appointment_button.dart';
import 'package:dahab_clinic_management/widgets/specialist_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditBookingScreen extends StatefulWidget {
  const EditBookingScreen({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<EditBookingScreen> createState() => _EditBookingScreenState();
}

class _EditBookingScreenState extends State<EditBookingScreen> {
  SpecialistController specialistController = Get.put(SpecialistController());
  ReversationController reversationController =
      Get.put(ReversationController());
  SessionsController sessionsController = Get.put(SessionsController());
  @override
  void initState() {
    specialistController.getSpecialist(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (specialistController.resultModel.value is ListOf<SpecialistModel>) {
          print(specialistController
              .getSpecialistId(specialistController.selectedIndex.value));
          reversationController.getShiftTimesByDate(
              widget.id,
              (specialistController
                  .getSpecialistId(specialistController.selectedIndex.value)),
              formatDate(reversationController.focusedDay.value));
          return Scaffold(
            backgroundColor: ColorManager.jBrownColor,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(25.0),
              child: AppBar(
                backgroundColor: ColorManager.jBrownColor,
                leading: const LeadingIcon(),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SpecialistCard(
                  serviceId: widget.id,
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 550,
                    decoration: const BoxDecoration(
                      color: ColorManager.kCoffeeColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const BuildTableCalendar(),
                        reversationController.isWeekend.value
                            ? const NonValidDate()
                            : Obx(
                                () {
                                  if (reversationController.timeResult.value
                                      is ListOf<ShiftTimeModel>) {
                                    return HourShift(
                                        reversationController:
                                            reversationController,
                                        length: (reversationController
                                                    .timeResult.value
                                                as ListOf<ShiftTimeModel>)
                                            .resutl
                                            .length,
                                        offer: false);
                                  } else if (reversationController
                                      .resultModel.value is ExceptionResult) {
                                    return const Center(
                                      child:
                                          Text("Oops there is something wrong"),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: reversationController.timeSelected.value
                                ? () {
                                    sessionsController.editSession(
                                        widget.id,
                                              (reversationController.timeResult.value
                                                as ListOf<ShiftTimeModel>)
                                            .resutl[reversationController
                                                .currentIndex.value!]
                                            .id
                                          ,
                                        specialistController.getSpecialistId(
                                            specialistController
                                                .selectedIndex.value));
                                    showConfirmEditReversationDialog();
                                  }
                                : null,
                            style: StyleManager.ElevatedButtonStyle,
                            child: Text(
                              "Edit Appointment",
                              style: StyleManager.buttunTextStyle,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (specialistController.resultModel.value is ExceptionResult) {
          return NoDataScreen();
        } else {
          return  const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
