// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dahab_clinic_management/models/result_model.dart';

class ServiceResponseModel extends ResultModel {
  final int id;
  final String name;
  final String? image;
  
  ServiceResponseModel({
    required this.id,
    required this.name,
    required this.image,
  });

  ServiceResponseModel copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return ServiceResponseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory ServiceResponseModel.fromMap(Map<String, dynamic> map) {
    return ServiceResponseModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceResponseModel.fromJson(String source) => ServiceResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ServiceResponseModel(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant ServiceResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}

