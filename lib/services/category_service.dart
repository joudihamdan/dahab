import 'dart:convert';

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
        if(response.data!=null) {
          CategoryModel category = CategoryModel.fromMap(response.data);
          // CategoryModel data= CategoryModel(id: response.data['id'], name:response.data['name'], image: response.data['image'], description: response.data['description']);
          print("Category get successfully");
          return category;
        }
        else{
          print("No data");
          return EmptyResult("There is No Data");
        }
      } else {
        return ErrorsResult("oops something is Wrong");
      }
    } on DioException catch (e) {
      print("lk wliiiiiiiiiiiiiiii" );
      print(e.type.toString());
      print(e.toString());
      return ExceptionResult(
        message: e.message!,
      );
    }
  }


  Future<ResultModel> getServices(int categoryId) async {
    try {
      print("hi from service");
      response = await dio.get("$baseUrl/Services/$categoryId");
      print("hi the statuscode is ${response.statusCode}");
      print(response.data);
      if (response.statusCode == 200) {
        List<ServiceResponseModel> services = List.generate(
            response.data.length,
                (index) => ServiceResponseModel.fromMap(response.data[index]),);
        print(services);
        print("services get successfully");
        return ListOf(resutl: services);
      } else {
        return ErrorsResult("oops something is Wrong");
      }
    } on DioException catch (e) {
      print(e.toString());

      return  ExceptionResult(
        message: e.message!,
      );
    }
  }


  Future<ResultModel> getServiceById(int id) async {
    try {
      response = await dio.get("$baseUrl/seviceDetails/$id");
      print(response.data);
      if (response.statusCode == 200) {
        ServiceDetailsResponseModel service = ServiceDetailsResponseModel.fromMap(response.data);
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
