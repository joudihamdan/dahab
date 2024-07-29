
// ignore_for_file: avoid_print

import 'package:dahab_clinic_management/models/response/category_model.dart';
import 'package:dahab_clinic_management/models/response/service_response_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

import '../models/response/service_details_response_model.dart';

class CategoryService extends BaseServices {
  Future<ResultModel> getCategoryById(int id) async {
    try {
      response = await dio.get("$baseUrl/Category/$id");
      if (response.statusCode == 200) {
        if (response.data != null) {
          CategoryModel category = CategoryModel.fromMap(response.data);
          print("Category get successfully");
          return category;
        } else {
          print("No data");
          return EmptyResult("There is No Data");
        }
      } else {
        return ErrorsResult("oops something is Wrong");
      }
    } on DioException catch (e) {
      print("lk wliiiiiiiiiiiiiiii");
      print(e.type.toString());
      print(e.toString());
      return ExceptionResult(
        message: e.message!,
      );
    }
  }
}
