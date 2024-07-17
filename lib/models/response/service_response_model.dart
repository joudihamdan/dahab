// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dahab_clinic_management/models/result_model.dart';

class ServiceResponseModel extends ResultModel{
  final int id;
  final int category_id;
  final String name;
  final String image;
  final String description;
  final double price;

  ServiceResponseModel({
    required this.id,
    required this.category_id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  ServiceResponseModel copyWith({
    int? id,
    int? category_id,
    String? name,
    String? image,
    String? description,
    double? price,
  }) {
    return ServiceResponseModel(
      id: id ?? this.id,
      category_id: category_id ?? this.category_id,
      name: name ?? this.name,
      image: image ?? this.image,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category_id': category_id,
      'name': name,
      'image': image,
      'description': description,
      'price': price,
    };
  }

  factory ServiceResponseModel.fromMap(Map<String, dynamic> map) {
    return ServiceResponseModel(
      id: map['id'] as int,
      category_id: map['category_id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceResponseModel.fromJson(String source) => ServiceResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceModel(id: $id, category_id: $category_id, name: $name, image: $image, description: $description, price: $price)';
  }

  @override
  bool operator ==(covariant ServiceResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.category_id == category_id &&
      other.name == name &&
      other.image == image &&
      other.description == description &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      category_id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      description.hashCode ^
      price.hashCode;
  }
}
