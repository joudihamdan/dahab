import 'package:dio/dio.dart';

const String serverMode = 'http://pay-tek.cloud:9000';
const String localMode = "http://127.0.0.1:8000";

const String baseUrlImage = localMode;


class BaseServices {
  final String baseUrl = "$localMode/api";

  Dio dio = Dio();
  late Response response;
}
