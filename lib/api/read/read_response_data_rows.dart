part of '../api.dart';

class ReadResponseDataRows {
  final int id;
  final String fullName;
  final String email;
  final int gender;
  final String dob;
  final String createdDate;

  ReadResponseDataRows({
    required this.id,
    required this.fullName,
    required this.email,
    required this.gender,
    required this.dob,
    required this.createdDate
  });

  factory ReadResponseDataRows.fromJson(Map<String, dynamic> json) => ReadResponseDataRows(
      id: json['id'],
    fullName: json['fullname'],
    email: json['email'],
    gender: json['gender'],
    dob: json['dob'],
    createdDate: json['created_date']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': this.id,
    'fullName': this.fullName,
    'email': this.email,
    'gender': this.gender,
    'dob': this.dob,
    'createdDate': this.createdDate
  };
}