part of '../api.dart';

class ReadService {
  static getReadData(
      String url,
      int page,
      int offset
      ) {
    ReadRequest request = ReadRequest(
        page: page, offset: offset);

    return ApiProvider().getReadData(url, request);
  }
}