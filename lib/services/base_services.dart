
import 'package:dio/dio.dart';

class BaseServices{
  final String baseUrl='http://127.0.0.1:8000/api';
 Dio dio = Dio();
 late Response response;
}