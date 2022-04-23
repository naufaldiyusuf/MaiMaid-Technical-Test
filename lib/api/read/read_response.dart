part of '../api.dart';

class ReadResponse {
  final ReadResponseStatus? status;
  final ReadResponseData? data;

  ReadResponse({
    this.status,
    this.data
  });

  factory ReadResponse.fromJson(Map<String, dynamic> json) {
    ReadResponseStatus? statusResponse;
    ReadResponseData? dataResponse;

    if (json['status'] != null) {
      statusResponse = ReadResponseStatus.fromJson(json['status']);
    }

    if (json['data'] != null) {
      dataResponse = ReadResponseData.fromJson(json['data']);
    }

    return ReadResponse(
      status: statusResponse,
      data: dataResponse
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'status': this.status,
    'data': this.data
  };
}