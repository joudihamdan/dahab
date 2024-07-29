// ignore_for_file: avoid_print

import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/spacialist_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

class SpecialistService extends BaseServices {

  Future<ResultModel> getSpecialist(int serviceId) async {
    try {
      response = await dio.get("$baseUrl/service-specialist/$serviceId/specialist-names");
      if (response.statusCode == 200) {
        List<SpecialistModel> services = List.generate(
          response.data.length,
          (index) => SpecialistModel.fromMap(response.data[index]),
        );
        print("specialist get successfully");
        return ListOf<SpecialistModel>(resutl: services);
      } else {
        return ErrorsResult("oops something is Wrong");
      }
    } on DioException catch (e) {
      print(e.toString());
      return ExceptionResult(
        message: e.message!,
      );
    }
  }

}
