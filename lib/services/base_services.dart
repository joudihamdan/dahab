
import 'package:dio/dio.dart';
const String baseUrlImage='http://127.0.0.1:8000';
class BaseServices{
  final String baseUrl='http://127.0.0.1:8000/api';

 Dio dio = Dio();
 late Response response;
}