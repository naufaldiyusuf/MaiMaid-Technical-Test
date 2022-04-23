part of '../api.dart';

class ViewRequest {
  final int id;

  ViewRequest({
    required this.id,
  });

  factory ViewRequest.fromJson(Map<String, dynamic> json) => ViewRequest(
      id: json['id'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': this.id,
  };
}