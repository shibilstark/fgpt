import 'dart:async';
import 'package:dio/dio.dart';
import 'package:fgpt_ai/config/build_config/build_config.dart';
import 'package:fgpt_ai/config/keys/keys.dart';

class AppNetwork {
  static String getBaseUrl() {
    return 'https://v1-api-testing.connectmazjid.com/api/';
  }

  static BaseOptions getBaseOptions(Map<String, dynamic>? queryParameters) =>
      BaseOptions(
        headers: getHeaders(),
        queryParameters: queryParameters,
        receiveDataWhenStatusError: true,
        sendTimeout: BuildConfig.instance.config.requestTimeOut,
        connectTimeout: BuildConfig.instance.config.requestTimeOut,
        receiveTimeout: BuildConfig.instance.config.requestTimeOut,
      );

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await Dio(getBaseOptions(queryParameters)).get(url);
  }

  static Future<Response> post(
      {required String url,
      Map<String, dynamic>? queryParameters,
      required Map<String, dynamic>? data}) async {
    return await Dio(getBaseOptions(queryParameters)).post(url, data: data);
  }

  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await Dio(getBaseOptions(queryParameters)).delete(url);
  }

  static bool checkResponse(Response res) {
    if (res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Map<String, String> getHeaders() {
    return {
      'content-type': 'application/json',
      'Authorization': "Bearer ${AppKeys.apiKey}"
    };
  }

  static String fetchMessage(Response res) {
    return res.data['message'] as String;
  }
}
