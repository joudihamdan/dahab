// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dahab_clinic_management/models/result_model.dart';

class SpecialistModel extends ResultModel {
  final int id;
  final String name;
  final String description;
  
  SpecialistModel({
    required this.id,
    required this.name,
    required this.description,
  });

  SpecialistModel copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return SpecialistModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory SpecialistModel.fromMap(Map<String, dynamic> map) {
    return SpecialistModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialistModel.fromJson(String source) =>
      SpecialistModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SpecialistModel(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(covariant SpecialistModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
