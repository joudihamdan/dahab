import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/specialist_service.dart';
import 'package:get/get.dart';

class SpecialistController extends GetxController{
  var resultModel= ResultModel().obs;
  var selectedIndex = 0.obs;

void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  getSpecialist(id) async {
    resultModel.value = await SpecialistService().getSpecialist(id);
  }


}