part of '../api.dart';

class UpdateResponseStatus {
  final int code;
  final String? message;

  UpdateResponseStatus({
    required this.code,
    this.message
  });

  factory UpdateResponseStatus.fromJson(Map<String, dynamic> json) => UpdateResponseStatus(
      code: json['code'],
      message: json['message']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': this.code,
    'message': this.message
  };
}