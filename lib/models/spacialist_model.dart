import 'package:dahab_clinic_management/models/result_model.dart';

class SpecialistModel extends ResultModel  {
  final  String name;
  final String specialty;
  final String experience;
  final String imageUrl;

  SpecialistModel({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.imageUrl,
  });


}