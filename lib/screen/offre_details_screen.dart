import 'package:dahab_clinic_management/controllers/offers_controller.dart';
import 'package:dahab_clinic_management/controllers/reversation_controller.dart';
import 'package:dahab_clinic_management/helper/date_formate.dart';
import 'package:dahab_clinic_management/models/offers_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/utils/color_manager.dart';
import 'package:dahab_clinic_management/utils/style_maneger.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/build_hours_shift.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/build_table_calendare.dart';
import 'package:dahab_clinic_management/widgets/book%20widgets/non_valid_date.dart';
import 'package:dahab_clinic_management/widgets/leading_icon.dart';
import 'package:dahab_clinic_management/widgets/make_appointment_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffreDetailsScreen extends StatelessWidget {
  const OffreDetailsScreen({super.key, required this.offerId});
  final int offerId;

  @override
  Widget build(BuildContext context) {
    final ReversationController reversationController =
        Get.put(ReversationController());
    OffersController offersController = Get.put(OffersController());
    offersController.getOfferDetails(offerId);
  //  reversationController.getOfferTimes(offerId,formatDate(reversationController.focusedDay.value));
    return Scaffold(
      backgroundColor: ColorManager.jCreamColor,
      appBar: AppBar(
        backgroundColor: ColorManager.kBrownColor,
        leading: const LeadingIcon(),
        title: const Text(
          "Offer Details",
          style: StyleManager.kAppBar,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () {
              if (offersController.offerResult.value is OffersModel) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (offersController.offerResult.value as OffersModel)
                            .name,
                        style: StyleManager.headerTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (offersController.offerResult.value as OffersModel)
                            .description,
                        style: StyleManager.normalText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "price: ${(offersController.offerResult.value as OffersModel).price}",
                        style: StyleManager.normalText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 520,
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
                  Obx(
                    () => reversationController.isWeekend.value
                        ? const NonValidDate()
                        : const BuildHoursShift(
                            id: 1,
                          ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: reversationController.timeSelected.value
                          ? () {
                              //    reversationController.bookOffer(offerId,formatDate(reversationController.focusedDay.value),(reversationController.timeResult.value as ListSt).resutl[reversationController.currentIndex.value!]);

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
  }
}
