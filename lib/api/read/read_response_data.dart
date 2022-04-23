part of '../api.dart';

class ReadResponseData {
  final int total;
  final List<ReadResponseDataRows>? rows;

  ReadResponseData({
    required this.total,
    this.rows
  });

  factory ReadResponseData.fromJson(Map<String, dynamic> json) {
    List<ReadResponseDataRows>? rowsData = [];

    if (json['rows'] != null) {
      json['rows'].forEach((e) {
        rowsData.add(ReadResponseDataRows.fromJson(e));
      });
    }
    return ReadResponseData(
        total: json['total'],
        rows: rowsData
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'total': this.total,
    'rows': this.rows
  };
}