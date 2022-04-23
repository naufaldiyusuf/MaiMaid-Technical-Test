part of '../api.dart';

class ViewResponse {
  final ViewResponseStatus? status;
  final ViewResponseData? data;

  ViewResponse({
    this.status,
    this.data
  });

  factory ViewResponse.fromJson(Map<String, dynamic> json) {
    ViewResponseStatus? statusResponse;
    ViewResponseData? dataResponse;

    if (json['status'] != null) {
      statusResponse = ViewResponseStatus.fromJson(json['status']);
    }

    if (json['data'] != null) {
      dataResponse = ViewResponseData.fromJson(json['data']);
    }

    return ViewResponse(
      status: statusResponse,
      data: dataResponse
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'status': this.status,
    'data': this.data
  };
}