// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dahab_clinic_management/models/result_model.dart';

class ShiftTimeModel extends ResultModel {
  final int id; 
  final String time;
  ShiftTimeModel({
    required this.id,
    required this.time,
  });

  ShiftTimeModel copyWith({
    int? id,
    String? time,
  }) {
    return ShiftTimeModel(
      id: id ?? this.id,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'time': time,
    };
  }

  factory ShiftTimeModel.fromMap(Map<String, dynamic> map) {
    return ShiftTimeModel(
      id: map['id'] as int,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShiftTimeModel.fromJson(String source) => ShiftTimeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShiftTimeModel(id: $id, time: $time)';

  @override
  bool operator ==(covariant ShiftTimeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.time == time;
  }

  @override
  int get hashCode => id.hashCode ^ time.hashCode;
}
