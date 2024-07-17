import 'package:dahab_clinic_management/models/response/category_model.dart';
import 'package:dahab_clinic_management/models/response/service_response_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';

class CategoryService extends BaseServices {

  Future<ResultModel> getCategoryById(int id) async {
    try {
      print("2");
      response = await dio.get("$baseUrl/Category/$id");
      if (response.statusCode == 200) {
        CategoryModel category = CategoryModel.fromMap(response.data);
        print(category);
        print(response.data);
       // CategoryModel data= CategoryModel(id: response.data['id'], name:response.data['name'], image: response.data['image'], description: response.data['description']);
        return category;
      } else {
        return ErrorsResult("oops something is Wrong");
      }
    } on DioException catch (e) {
      print("lk wliiiiiiiiiiiiiiii" );
      return ExceptionResult(
        message: e.message!,
      );
    }
  }


  Future<ResultModel> getServices(int categoryId) async {
    try {
      response = await dio.get("$baseUrl+$categoryId");
      if (response.statusCode == 200) {
        List<ServiceResponseModel> services = List.generate(
            response.data.legnth,
            (index) => ServiceResponseModel.fromMap(response.data));
        return ListOf(resutl: services);
      } else {
        return ErrorsResult("oops something is Wrong");
      }
    } on DioException catch (e) {
      return ExceptionResult(
        message: e.message!,
      );
    }
  }


  Future<ResultModel> getServiceById(int id) async {
    try {
      response = await dio.get("$baseUrl+/$id");
      if (response.statusCode == 200) {
        ServiceResponseModel service = ServiceResponseModel.fromMap(response.data);
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
