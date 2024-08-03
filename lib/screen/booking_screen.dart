import 'package:dahab_clinic_management/controllers/connect_controller.dart';
import 'package:dahab_clinic_management/controllers/reversation_controller.dart';
import 'package:dahab_clinic_management/controllers/specialist_controller.dart';
import 'package:dahab_clinic_management/helper/date_formate.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/shift_time_model.dart';
import 'package:dahab_clinic_management/models/spacialist_model.dart';
import 'package:dahab_clinic_management/screen/global/no_internet_screen.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/build_hours_shift.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/build_table_calendare.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/non_valid_date.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/widgets/make_appointment_button.dart';
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
    print(specialistController.resultModel.value);
    return Obx(
      () {
        if (specialistController.resultModel.value is ListOf<SpecialistModel>) {
          reversationController.getShiftTimesByDate(
              widget.serviceId,
              (specialistController.getSpecialistId(
                  specialistController.selectedIndex.value + 1)),
              formatDate(reversationController.focusedDay.value));
          print(specialistController
              .getSpecialistId(specialistController.selectedIndex.value + 1));
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
                            : BuildHoursShift(
                                id: widget.serviceId,
                              ),
                        const Spacer(),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: reversationController.timeSelected.value
                                ? () {
                                    reversationController.bookAppointment(
                                        reversationController
                                            .currentIndex.value!);
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
                        // Obx(() {
                        //   print(reversationController.timeResult.value);
                        //   if (reversationController.timeResult.value
                        //       is ListOf<ShiftTimeModel>) {
                        //     return MakeAppointmentButton(
                        //         timeId: (reversationController.timeResult
                        //                 .value as ListOf<ShiftTimeModel>)
                        //             .resutl[1]
                        //             .id,
                        //         timeSelectd:
                        //             reversationController.timeSelected.value);
                        //   } else {
                        //     {
                        //       return const Center(
                        //           child: CircularProgressIndicator());
                        //     }
                        //   }
                        // }),
                        const Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else if(specialistController.resultModel.value is ExceptionResult){
          return Text("oops");
        }
        
        else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
