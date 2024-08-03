import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:get/get.dart';

import '../services/services_services.dart';

class ServiceController extends GetxController {
  var resultModel = ResultModel().obs;
 
 

  getServicesDetails(id) async {
    resultModel.value = await ServicesService().getServiceById(id);
  }
}

class ServiceControllerNew extends GetxController {
   var resultModel = ResultModel().obs;

  getServices(id) async {
    try {
      resultModel.value = await ServicesService().getServices(id);
    } catch (e) {
      print(e);
    }
  }
}