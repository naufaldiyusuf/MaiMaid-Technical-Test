part of '../api.dart';

class WriteResponseStatus {
  final int code;
  final String? message;

  WriteResponseStatus({
    required this.code,
    this.message
  });

  factory WriteResponseStatus.fromJson(Map<String, dynamic> json) => WriteResponseStatus(
      code: json['code'],
      message: json['message']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': this.code,
    'message': this.message
  };
}