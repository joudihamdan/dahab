// ignore_for_file: avoid_print

import 'package:dahab_clinic_management/const/constant.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

class OfferBookingServices extends BaseServices {
  Future<ResultModel> getOfferTimesByDate(int offerId, String date) async {
    try {
      response = await dio.get(
        "$baseUrl/availableslot/$offerId?date=$date",
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );
      print(response.data);
      if (response.statusCode == 200) {
        List times = response.data;
        print(response.data);
        print("offre times get successfully");
        return ListSt(resutl: times);
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

  Future<ResultModel> bookOfferAppointment(
      int offerId, String date, String time) async {
    try {
      response = await dio.post("$baseUrl/offer/$offerId",
          options: Options(
            headers: {'Authorization': "Bearer $token"},
          ),
          data: {"date": date, "time": time});
      if (response.statusCode == 200) {
        print(response.data);
        print("0ffer appointment booked successfully");
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
