import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:maimaid_technical_project/constant.dart';

import 'api.dart';
import 'interceptors.dart';

class ApiProvider {
  final _dio = createDio();

  static Dio createDio() {
    Dio dio = Dio(BaseOptions(baseUrl: ConstantUrl.BASEURL, connectTimeout: 50000, receiveTimeout: 30000));

    setInterceptors(dio);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return dio;
  }

  static void setInterceptors(Dio dio) {
    dio.interceptors.clear();
    dio.interceptors.add(AppInterceptors());
  }

  Future<ReadResponse> getReadData(String url, ReadRequest request) async {
    print(request.toJson());
    Response response = await _dio.post(url, data: request);
    return ReadResponse.fromJson(response.data);
  }

  Future<WriteResponse> writeData(String url, WriteRequest request) async {
    print(request.toJson());
    Response response = await _dio.post(url, data: request);
    return WriteResponse.fromJson(response.data);
  }

  Future<UpdateResponse> updateData(String url, UpdateRequest request) async {
    print(request.toJson());
    _dio.options.headers['content-Type'] = 'application/json';
    Response response = await _dio.post(url, data: request);
    return UpdateResponse.fromJson(response.data);
  }

  Future<ViewResponse> getViewData(String url, ViewRequest request) async {
    print(request.toJson());
    Response response = await _dio.post(url, data: request);
    return ViewResponse.fromJson(response.data);
  }
}