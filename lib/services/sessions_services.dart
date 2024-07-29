// ignore_for_file: avoid_print

import 'package:dahab_clinic_management/const/constant.dart';
import 'package:dahab_clinic_management/models/response/sessions_model.dart';
import 'package:dahab_clinic_management/models/result_model.dart';
import 'package:dahab_clinic_management/services/base_services.dart';
import 'package:dio/dio.dart';


class SessionsServices extends BaseServices {
 
  Future<ResultModel> getPendingSession() async {
    try {
      response = await dio.get(
        "$baseUrl/sessions/pending",
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        List<SessionsModel> sessions = List.generate(
          response.data.length,
          (index) => SessionsModel.fromMap(response.data[index]),
        );
        print("sessions get successfully");
        return ListOf<SessionsModel>(resutl: sessions);
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

  Future<ResultModel> getApprovedSession() async {
    try {
      response = await dio.get(
        "$baseUrl/sessions/approved",
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        List<SessionsModel> sessions = List.generate(
          response.data.length,
          (index) => SessionsModel.fromMap(response.data[index]),
        );
        print("sessions get successfully");
        return ListOf<SessionsModel>(resutl: sessions);
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

  Future<ResultModel> getCompletedSession() async {
    try {
      response = await dio.get(
        "$baseUrl/sessions/completed",
        options: Options(headers: {'Authorization': "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        List<SessionsModel> sessions = List.generate(
          response.data.length,
          (index) => SessionsModel.fromMap(response.data[index]),
        );
        print("sessions get successfully");
        return ListOf<SessionsModel>(resutl: sessions);
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
