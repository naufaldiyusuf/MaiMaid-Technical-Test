part of '../api.dart';

class ReadRequest {
  final int page;
  final int offset;

  ReadRequest({
    required this.page,
    required this.offset
  });

  factory ReadRequest.fromJson(Map<String, dynamic> json) => ReadRequest(
      page: json['page'],
      offset: json['offset']
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'page': this.page,
    'offset': this.offset
  };
}