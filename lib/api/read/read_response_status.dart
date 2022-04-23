part of '../api.dart';

class ReadResponseStatus {
  final int code;
  final String? message;

  ReadResponseStatus({
    required this.code,
    this.message
  });

  factory ReadResponseStatus.fromJson(Map<String, dynamic> json) => ReadResponseStatus(
      code: json['code'],
      message: json['message']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': this.code,
    'message': this.message
  };
}