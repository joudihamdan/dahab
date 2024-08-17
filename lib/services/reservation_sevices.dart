// ignore_for_file: avoid_print

import 'package:dahab_clinic_management/const/constant.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/models/shift_time_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

class ReservationSevices extends BaseServices {
  Future<ResultModel> getTimesByDate(
      int serviceId, int specialistId, String date) async {
    try {
      response = await dio.get(
        "$baseUrl/available/$serviceId/$specialistId?date=$date",
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        List<ShiftTimeModel> times = List.generate(
          response.data.length,  
          (index) => ShiftTimeModel.fromMap(response.data[index]),
        );
        print("times get successfully");
        print(times);
        return ListOf<ShiftTimeModel>(resutl: times);
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
    print("the time id is $timeId");
    try {
      response = await dio.post(
        "$baseUrl/slots/$timeId/book",
        options: Options(
          headers: {'Authorization': "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        print("appointment booked successfully");
        return SuccessResult();
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
