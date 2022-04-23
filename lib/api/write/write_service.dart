part of '../api.dart';

class WriteService {
  static writeData(
      String url,
  String fullName,
  String email,
  String password,
  int gender,
  String dob,
      ) {
    WriteRequest request = WriteRequest(
        fullName: fullName, email: email, password: password, gender: gender, dob: dob);

    return ApiProvider().writeData(url, request);
  }
}