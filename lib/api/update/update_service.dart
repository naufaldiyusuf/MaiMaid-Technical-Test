part of '../api.dart';

class UpdateService {
  static UpdateData(
      String url,
  int id,
  String fullName,
  String email,
  String password,
  int gender,
  String dob,
      ) {
    UpdateRequest request = UpdateRequest(
        id: id, fullName: fullName, email: email, password: password, gender: gender, dob: dob);

    return ApiProvider().updateData(url, request);
  }
}