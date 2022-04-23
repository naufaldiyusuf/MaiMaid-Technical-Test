part of '../api.dart';

class ViewResponseStatus {
  final int code;
  final String? message;

  ViewResponseStatus({
    required this.code,
    this.message
  });

  factory ViewResponseStatus.fromJson(Map<String, dynamic> json) => ViewResponseStatus(
      code: json['code'],
      message: json['message']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': this.code,
    'message': this.message
  };
}