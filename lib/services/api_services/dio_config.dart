


import 'package:dio/dio.dart';
import 'package:torrins_assignment/utils/app_constants.dart';

class DioConfig {
  DioConfig._();

  static final instance = DioConfig._();

  BaseOptions options = BaseOptions(
    connectTimeout: AppConstants.connectionTimeout,
    receiveTimeout: AppConstants.receiveTimeout,
    responseType: ResponseType.json,
  );

  Dio dio = Dio();

  Dio getInstance() {
    dio.interceptors.add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
      // options.headers["Authorization"] = "d34bc20ffe1897f2940cdc6eeb52a27b";
      options.headers["accept"] = "application/json";
      return handler.next(options);
    }));
    dio.options = options;
    return dio;
  }
}