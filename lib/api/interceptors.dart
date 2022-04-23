import 'package:dio/dio.dart';

class AppInterceptors extends InterceptorsWrapper {
  AppInterceptors();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print(options.uri.toString());
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print(response.data);
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print(err.message);
    return handler.next(err);
  }
}