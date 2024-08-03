// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dahab_clinic_management/models/service_response_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

import '../models/service_details_response_model.dart';

class ServicesService extends BaseServices {

  Future<ResultModel> getServices(int categoryId) async {
    try {
      response = await dio.get("$baseUrl/Services/$categoryId");
      if (response.statusCode == 200) {
        log("WHat the hell !!!");
        List<ServiceResponseModel> services = List.generate(
          response.data.length,
          (index) => ServiceResponseModel.fromMap(response.data[index]),
        );
        print("services get successfully");
        return ListOf<ServiceResponseModel>(resutl: services);
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


  Future<ResultModel> getServiceById(int id) async {
    try {
      response = await dio.get("$baseUrl/seviceDetails/$id");
      if (response.statusCode == 200) {
        ServiceDetailsResponseModel service =
            ServiceDetailsResponseModel.fromMap(response.data);
        return service;
      } else {
        return ErrorsResult("oops something is Wrong");
      }
    } on DioException catch (e) {
      return ExceptionResult(
        message: e.message!,
      );
    }
  }
}
