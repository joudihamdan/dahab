import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/sessions_model.dart';
import 'package:dahab_clinic_management/services/sessions_services.dart';
import 'package:get/get.dart';

class SessionsController extends GetxController {
  var selectedIndex = 0.obs;
  var resultModel = ResultModel().obs;
  var deleteUpdateRes= ResultModel().obs;

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

  deleteSession(int sessionId) async {
    deleteUpdateRes.value = await SessionsServices().cancelReservation(sessionId);
    if(deleteUpdateRes.value is SuccessResult){
      removeSession(sessionId);
    }
  }

  editSession(int sessionId, int timeId,int speciallistId) async {
    deleteUpdateRes.value =
        await SessionsServices().editReservation(sessionId, timeId,speciallistId);
        
  }

  removeSession(int id) {
    if (resultModel.value is ListOf<SessionsModel>) {
      var list = (resultModel.value as ListOf<SessionsModel>).resutl;
      list.removeWhere((session) => session.id == id);
      resultModel.value = ListOf<SessionsModel>(resutl: list);
    }
  }
}
