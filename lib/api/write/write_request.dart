part of '../api.dart';

class WriteRequest {
  final String fullName;
  final String email;
  final String password;
  final int gender;
  final String dob;

  WriteRequest({
    required this.fullName,
    required this.email,
    required this.password,
    required this.gender,
    required this.dob
  });

  factory WriteRequest.fromJson(Map<String, dynamic> json) => WriteRequest(
      fullName: json['fullname'],
      email: json['email'],
    password: json['password'],
    gender: json['gender'],
    dob: json['dob']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'fullName': this.fullName,
    'email': this.email,
    'password': this.password,
    'gender': this.gender,
    'dob': this.dob
  };
}