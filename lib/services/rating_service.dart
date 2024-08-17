import 'package:dahab_clinic_management/const/constant.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

class RatingService extends BaseServices {
  Future<ResultModel> addRate(int rate) async {
    try {
      response = await dio.post("$baseUrl/rate",
          options: Options(headers: {'Authorization': "Bearer $token"}),
          data: {"rating": "$rate"});
      if (response.statusCode == 200) {
        print(rate);
        return SuccessResult();
      } else {
        return EmptyResult("oops failde rerate again!");
      }
    } on DioException catch (e) {
      // print(e.toString());
      return ExceptionResult(
        message: e.message!,
      );
    }
  }

  Future<ResultModel> getRate() async {
    try {
      response = await dio.get("$baseUrl/rates");

      if (response.statusCode == 200) {
        print("successssssssss");
        print(response.data);
        return justString(response.data);
      } else {
        return ErrorsResult("oops failde rerate again!");
      }
    } on DioException catch (e) {
      // print(e.toString());
      return ExceptionResult(
        message: e.message!,
      );
    }
  }
}
