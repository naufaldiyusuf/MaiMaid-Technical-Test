part of '../api.dart';

class UpdateResponse {
  final UpdateResponseStatus? status;

  UpdateResponse({
    this.status,
  });

  factory UpdateResponse.fromJson(Map<String, dynamic> json) {
    UpdateResponseStatus? statusResponse;

    if (json['status'] != null) {
      statusResponse = UpdateResponseStatus.fromJson(json['status']);
    }

    return UpdateResponse(
      status: statusResponse,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'status': this.status,
  };
}