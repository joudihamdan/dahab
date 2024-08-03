// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dahab_clinic_management/models/result_model.dart';

class ServiceDetailsResponseModel extends ResultModel{
  final int id;
  final int category_id;
  final String name;
  final String image;
  final String description;
  final int price;

  ServiceDetailsResponseModel({
    required this.id,
    required this.category_id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  ServiceDetailsResponseModel copyWith({
    int? id,
    int? category_id,
    String? name,
    String? image,
    String? description,
    int? price,
  }) {
    return ServiceDetailsResponseModel(
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

  factory ServiceDetailsResponseModel.fromMap(Map<String, dynamic> map) {
    return ServiceDetailsResponseModel(
      id: map['id'] as int,
      category_id: map['category_id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceDetailsResponseModel.fromJson(String source) => ServiceDetailsResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceModel(id: $id, category_id: $category_id, name: $name, image: $image, description: $description, price: $price)';
  }

  @override
  bool operator ==(covariant ServiceDetailsResponseModel other) {
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
