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

  Future<double> getRate() async {
    try {
      response = await dio.get("$baseUrl/rates");

      if (response.statusCode == 200) {
        String ratingString = response.data.toString();
        double rating = double.parse(ratingString);
        print("successss and the avg is $rating");
        return rating;
      } else {
        throw Exception('Failed to load rating');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load rating');
    }
  }

  Future<ResultModel> addReview(String review) async {
    try {
      response = await dio.post("$baseUrl/addReview",
          options: Options(headers: {'Authorization': "Bearer $token"}),
          data: {"review": review});
      print(review);
      return SuccessResult();
    } on DioException catch (e) {
      return ExceptionResult(
        message: e.message!,
      );
    }
  }
}
