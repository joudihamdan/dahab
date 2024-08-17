// ignore_for_file: avoid_print

import 'package:dahab_clinic_management/const/constant.dart';
import 'package:dahab_clinic_management/models/sessions_model.dart';
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
        if (sessions.isEmpty) {
          return EmptyResult("is empty");
        } else {
          print("sessions get successfully");
          return ListOf<SessionsModel>(resutl: sessions);
        }
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
        if (sessions.isEmpty) {
          return EmptyResult("is empty");
        } else {
          print("sessions get successfully");
          return ListOf<SessionsModel>(resutl: sessions);
        }
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
        if (sessions.isEmpty) {
          return EmptyResult("is empty");
        } else {
          print("sessions get successfully");
          return ListOf<SessionsModel>(resutl: sessions);
        }
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


  Future<ResultModel> cancelReservation(int sessionId) async {
    try {
      response = await dio.delete("$baseUrl/sessions/delete/$sessionId",
          options: Options(
            headers: {'Authorization': "Bearer $token"},
          ));
      print(response.statusCode);
      print(sessionId);
      if (response.statusCode == 200) {
        print("delete session done successfully");
        return SuccessResult();
      } else {
        return ErrorsResult("oops something is Wrong");
      }
    } on DioException catch (e) {
      print(e.toString());
      print("rno");
      return ExceptionResult(
        message: e.message!,
      );
    }
  }

  Future<ResultModel> editReservation(int sessionId, int timeId ,int speciallistId) async {
    try {
      response = await dio.put("$baseUrl/sessions/update/$sessionId",
          options: Options(headers: {'Authorization': "Bearer $token"}),
          data: {
            "specialist_id": "$timeId", 
          "available_slots_id": "$speciallistId"
          });
      if (response.statusCode == 200) {
        print("edit done successfully");
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
