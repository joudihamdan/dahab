import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/offer_booking_services.dart';
import 'package:dahab_clinic_management/services/reservation_sevices.dart';
import 'package:get/get.dart';

class ReversationController extends GetxController {
  var resultModel = ResultModel().obs;
  var timeResult = ResultModel().obs;
  var today = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var dateSelected = false.obs;
  var timeSelected = false.obs;
  var isWeekend = false.obs;
  var currentIndex = Rxn<int>();

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    today.value = selectedDay;
    this.focusedDay.value = focusedDay;
    dateSelected.value = true;

    if (selectedDay.weekday == DateTime.friday) {
      isWeekend.value = true;
      currentIndex.value = null;
      timeSelected.value = false;
    } else {
      isWeekend.value = false;
    }
  }

  void onTimeSelected(int index) {
    currentIndex.value = index;
    timeSelected.value = true;
  }

  getShiftTimesByDate(int serviceId, int specialistId, String date) async {
    timeResult.value = await ReservationSevices()
        .getTimesByDate(serviceId, specialistId, date);
  }

  bookAppointment(int id) async {
    resultModel.value = await ReservationSevices().bookAppointment(id);
    
  }

  //////offfer
  var offertimeResult = ResultModel().obs;
  var successResult = ResultModel().obs;

  getOfferTimes(int offerId, String date) async {
    offertimeResult.value =
        await OfferBookingServices().getOfferTimesByDate(offerId, date);
  }

  bookOffer(int offerId, String date, String time) async {
    successResult.value =
        await OfferBookingServices().bookOfferAppointment(offerId, date, time);
  }
}
