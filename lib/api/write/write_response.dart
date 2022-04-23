part of '../api.dart';

class WriteResponse {
  final WriteResponseStatus? status;

  WriteResponse({
    this.status,
  });

  factory WriteResponse.fromJson(Map<String, dynamic> json) {
    WriteResponseStatus? statusResponse;

    if (json['status'] != null) {
      statusResponse = WriteResponseStatus.fromJson(json['status']);
    }

    return WriteResponse(
      status: statusResponse,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'status': this.status,
  };
}