part of '../api.dart';

class ViewService {
  static getViewData(
      String url,
      int id,
      ) {
    ViewRequest request = ViewRequest(
        id: id);

    return ApiProvider().getViewData(url, request);
  }
}