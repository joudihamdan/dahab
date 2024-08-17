// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dahab_clinic_management/models/result_model.dart';

class SessionsModel extends ResultModel {
  
  final int id;
  final String service;
  final String date;
  final String time;
  final String? specialist;
  SessionsModel({
    required this.id,
    required this.service,
    required this.date,
    required this.time,
     this.specialist,
  });
  


  SessionsModel copyWith({
    int? id,
    String? service,
    String? date,
    String? time,
    String? specialist,
  }) {
    return SessionsModel(
      id: id ?? this.id,
      service: service ?? this.service,
      date: date ?? this.date,
      time: time ?? this.time,
      specialist: specialist ?? this.specialist,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'service': service,
      'date': date,
      'time': time,
      'specialist': specialist,
    };
  }

  factory SessionsModel.fromMap(Map<String, dynamic> map) {
    return SessionsModel(
      id: map['id'] as int,
      service: map['service'] as String,
      date: map['date'] as String,
      time: map['time'] as String,
      specialist: map['specialist'] ,
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionsModel.fromJson(String source) => SessionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SessionsModel(id: $id, service: $service, date: $date, time: $time, specialist: $specialist)';
  }

  @override
  bool operator ==(covariant SessionsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.service == service &&
      other.date == date &&
      other.time == time &&
      other.specialist == specialist;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      service.hashCode ^
      date.hashCode ^
      time.hashCode ^
      specialist.hashCode;
  }
}

