import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/spacialist_model.dart';
import 'package:dahab_clinic_management/services/specialist_service.dart';
import 'package:get/get.dart';

class SpecialistController extends GetxController {
  var resultModel = ResultModel().obs;
  var selectedIndex = 0.obs;
  var ids = 0.obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  getSpecialist(id) async {
    resultModel.value = await SpecialistService().getSpecialist(id);
  }

  int getSpecialistId(int id) {
    if (resultModel.value is ListOf<SpecialistModel>) {
      var idd = (resultModel.value as ListOf<SpecialistModel>)
          .resutl[selectedIndex.value]
          .id;
      return idd;
    }
    return 0;
  }
}
