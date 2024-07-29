import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/mock/mock_reversation.dart';
import 'package:get/get.dart';

class ReversationController extends GetxController{
  var resultModel=ResultModel().obs;


  getShiftTimesByDate(int serviceId, int specialistId, String date)async{
    resultModel.value =await MockShiftTimeServices().getTimesByDate(serviceId, specialistId,date);
  }
}