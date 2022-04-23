part of '../api.dart';

class UpdateRequest {
  final int id;
  final String fullName;
  final String email;
  final String password;
  final int gender;
  final String dob;

  UpdateRequest({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.gender,
    required this.dob
  });

  factory UpdateRequest.fromJson(Map<String, dynamic> json) => UpdateRequest(
      id: json['id'],
      fullName: json['fullname'],
      email: json['email'],
    password: json['password'],
    gender: json['gender'],
    dob: json['dob']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': this.id,
    'fullName': this.fullName,
    'email': this.email,
    'password': this.password,
    'gender': this.gender,
    'dob': this.dob
  };
}