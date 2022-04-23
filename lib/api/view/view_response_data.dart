part of '../api.dart';

class ViewResponseData {
  final int id;
  final String fullName;
  final String email;
  final String? password;
  final int gender;
  final String? dob;
  final String createdDate;
  final String? updatedDate;

  ViewResponseData({
    required this.id,
    required this.fullName,
    required this.email,
    this.password,
    required this.gender,
    this.dob,
    required this.createdDate,
    required this.updatedDate
  });

  factory ViewResponseData.fromJson(Map<String, dynamic> json) => ViewResponseData(
    id: json['id'],
    fullName: json['fullname'],
    email: json['email'],
    password: json['password'],
    gender: json['gender'],
    dob: json['dob'],
    createdDate: json['created_date'],
    updatedDate: json['updated_date']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': this.id,
    'fullName': this.fullName,
    'email': this.email,
    'password': this.password,
    'gender': this.gender,
    'dob': this.dob,
    'createdDate': this.createdDate,
    'updatedDate': this.updatedDate
  };
}