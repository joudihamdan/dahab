// ignore_for_file: avoid_print

import 'package:dahab_clinic_management/models/offers_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

class OffersServices extends BaseServices {
  Future<ResultModel> getOffersbyId(int id) async {
    try {
      response = await dio.get("$baseUrl/offersServices/$id");
      if (response.statusCode == 200) {
        OffersModel offer = OffersModel.fromMap(response.data['offer']);
        print("offer details get successfully");
        return offer;
      } else {
        return ErrorsResult("oops something is Wrong");
      }
    } on DioException catch (e) {
      return ExceptionResult(
        message: e.message!,
      );
    }
  }

  Future<ResultModel> getOffres() async {
    try {
      response = await dio.get("$baseUrl/offers");
      if (response.statusCode == 200) {
        List<OffersModel> offers = List.generate(
          response.data.length,
          (index) => OffersModel.fromMap(response.data[index]),
        );
        print("offers get successfully");
        return ListOf<OffersModel>(resutl: offers);
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
