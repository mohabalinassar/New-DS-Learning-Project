// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dsproject/core/network/network_api.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class DioHelper {
  static final instance = DioHelper._();

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: Api.url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      receiveDataWhenStatusError: true,
    ),
  );

  //Singleton
  DioHelper._() {
    // Attach Logger
    if (kDebugMode) dio.interceptors.add(_logger);
  }

  // Logger
  static final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    error: true,
  );

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Api.url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> getData(String url, {Map<String, dynamic>? query, String? token}) async {
    try {
      return await dio.get(
        url,
        queryParameters: query,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> postData(
    String url, {
    Map<String, dynamic>? query,
    String? token,
    required Map<String, dynamic> body,
    FormData? multiPartBody,
  }) async {
    try {
      return await dio.post(
        url,
        queryParameters: query,
        data: multiPartBody ?? body,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> putData(
    String url, {
    required Map<String, dynamic> data,
    String? token,
    Map<String, dynamic>? query,
  }) async =>
      dio.put(
        url,
        queryParameters: query,
        data: data,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );

  Future<Response> deleteData(
    String url, {
    required Map<String, dynamic> data,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    try {
      return dio.delete(
        url,
        queryParameters: query,
        data: data,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (e) {
      return e.response!;
    }
  }
}

class NewDioHelper {
  static final instance = NewDioHelper._();

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: Api.url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      receiveDataWhenStatusError: true,
    ),
  );

  //Singleton
  NewDioHelper._() {
    // Attach Logger
    if (kDebugMode) dio.interceptors.add(_logger);
  }

  // Logger
  static final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: false,
    error: true,
  );

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Api.url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> getData(String url, {Map<String, dynamic>? query, String? token}) async {
    try {
      return await dio.get(
        url,
        queryParameters: query,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> postData(
    String url, {
    Map<String, dynamic>? query,
    String? token,
    required Map<String, dynamic> body,
    FormData? multiPartBody,
  }) async {
    try {
      return await dio.post(
        url,
        queryParameters: query,
        data: multiPartBody ?? body,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> putData(
    String url, {
    required Map<String, dynamic> data,
    String? token,
    Map<String, dynamic>? query,
  }) async =>
      dio.put(
        url,
        queryParameters: query,
        data: data,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );

  Future<Response> deleteData(
    String url, {
    required Map<String, dynamic> data,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    try {
      return dio.delete(
        url,
        queryParameters: query,
        data: data,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
