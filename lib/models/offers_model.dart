// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dahab_clinic_management/models/result_model.dart';

class OffersModel extends ResultModel {
  final int id;
  final String name;
  final String description;
  final int price;
  OffersModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  OffersModel copyWith({
    int? id,
    String? name,
    String? description,
    int? price,
  }) {
    return OffersModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  factory OffersModel.fromMap(Map<String, dynamic> map) {
    return OffersModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OffersModel.fromJson(String source) =>
      OffersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OffersModel(id: $id, name: $name, description: $description, price: $price)';
  }

  @override
  bool operator ==(covariant OffersModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ description.hashCode ^ price.hashCode;
  }
}
