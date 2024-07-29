// ignore_for_file: avoid_print

import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/shift_time_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

class ReservationSevices extends BaseServices{

  Future<ResultModel> getTimesByDate(int serviceId,int specialistId,String date) async {
    try {
      response = await dio.get("$baseUrl/");
      if (response.statusCode == 200) {
        List<ShiftTimeModel> services = List.generate(
          response.data.length,
          (index) => ShiftTimeModel.fromMap(response.data[index]),
        );
        print("times get successfully");
        return ListOf<ShiftTimeModel>(resutl: services);
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


Future<ResultModel> bookAppointment(int timeId) async {
    try {
      response = await dio.get("$baseUrl/");
      if (response.statusCode == 200) {
        List<ShiftTimeModel> services = List.generate(
          response.data.length,
          (index) => ShiftTimeModel.fromMap(response.data[index]),
        );
        print("times get successfully");
        return ListOf<ShiftTimeModel>(resutl: services);
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
