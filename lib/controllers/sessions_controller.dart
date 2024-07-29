import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/sessions_services.dart';
import 'package:get/get.dart';

class SessionsController extends GetxController {
  var selectedIndex = 0.obs;
  var resultModel = ResultModel().obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  getPendingSession() async {
    resultModel.value = await SessionsServices().getPendingSession();
  }
  getApprovedSession() async {
    resultModel.value = await SessionsServices().getApprovedSession();
  }

  getCompletedSession() async {
    resultModel.value = await SessionsServices().getCompletedSession();
  }
}
