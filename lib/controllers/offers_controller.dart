import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/offers_services.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  var offersListResult = ResultModel().obs;
  var offerResult = ResultModel().obs;


  getOfferDetails(int id) async {
    offerResult.value = await OffersServices().getOffersbyId(id);
  }

  getOffers() async {
    offersListResult.value = await OffersServices().getOffres();
  }
}
