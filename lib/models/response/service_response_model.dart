// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dahab_clinic_management/models/result_model.dart';

class ServiceResponseModel extends ResultModel {
  final String name;
  final String image;
  
  ServiceResponseModel({
    required this.name,
    required this.image,
  });

  ServiceResponseModel copyWith({
    String? name,
    String? image,
  }) {
    return ServiceResponseModel(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory ServiceResponseModel.fromMap(Map<String, dynamic> map) {
    return ServiceResponseModel(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceResponseModel.fromJson(String source) => ServiceResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ServiceResponseModel(name: $name, image: $image)';

  @override
  bool operator ==(covariant ServiceResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode;
}

