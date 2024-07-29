import 'package:dahab_clinic_management/const/constant.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

class ReviewService extends BaseServices {
  Future<ResultModel> addReview(int sessionId, String review) async {
    try {
      response = await dio.post("$baseUrl/review/$sessionId",
          options: Options(headers: {'Authorization': "Bearer $token"}),
          data: {"review": review});
      return SuccessResult();
    } on DioException catch (e) {
      // print(e.toString());
      return ExceptionResult(
        message: e.message!,
      );
    }
  }
}
