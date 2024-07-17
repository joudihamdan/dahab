// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dahab_clinic_management/models/result_model.dart';

class ServiceModel extends ResultModel {
  final String name;
  final String image;
  final String description;
  final double price;

  ServiceModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}
