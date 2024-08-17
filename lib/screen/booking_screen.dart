import 'package:dahab_clinic_management/controllers/connect_controller.dart';
import 'package:dahab_clinic_management/controllers/reversation_controller.dart';
import 'package:dahab_clinic_management/controllers/specialist_controller.dart';
import 'package:dahab_clinic_management/helper/date_formate.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/shift_time_model.dart';
import 'package:dahab_clinic_management/models/spacialist_model.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/build_table_calendare.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/non_valid_date.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/widgets/make_appointment_button.dart';
import 'package:dahab_clinic_management/widgets/hour_shift.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/specialist_card.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key, required this.serviceId});
  final int serviceId;
  

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  SpecialistController specialistController = Get.put(SpecialistController());
  ReversationController reversationController =
      Get.put(ReversationController());

  @override
  void initState() {
    specialistController.getSpecialist(widget.serviceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (specialistController.resultModel.value is ListOf<SpecialistModel>) {
            print(specialistController
                .getSpecialistId(specialistController.selectedIndex.value));
            reversationController.getShiftTimesByDate(
                widget.serviceId,
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
                    serviceId: widget.serviceId,
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 550,
                      decoration: const BoxDecoration(
                        color: ColorManager.jCreamColor,
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
                                      reversationController.bookAppointment(
                                        ( reversationController.timeResult.value as ListOf<ShiftTimeModel>).resutl[reversationController.currentIndex.value!].id
                                        );
                                      showConfirmReversationDialog();
                                    }
                                  : null,
                              style: StyleManager.ElevatedButtonStyle,
                              child: Text(
                                "Make Appointment",
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
            return Text("oops");
          } else {
            return  const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
