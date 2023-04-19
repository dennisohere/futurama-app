import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Method { post, get, put, delete, patch }

const BACKEND_HOST = 'https://api.sampleapis.com/futurama';

const _API_BASE_URL = '$BACKEND_HOST/';

final httpServiceProvider =
    Provider.family<Future<Response>, ApiRequestModel>((ref, apiRequestModel) {

  return HttpService.callApi(
    url: apiRequestModel.url,
    user: null,
    payload: apiRequestModel.payload,
    method: apiRequestModel.method,
  ).onError((error, stackTrace) {

    return Future.error(error!);
  });
});

class HttpService {
  Dio? _dio;
  dynamic user;

  static Future<Response> callApi({
    dynamic user,
    required String url,
    Method method = Method.get,
    dynamic payload,
  }) async {
    final http = HttpService(user: user);
    return await http.request(
      url: url,
      method: method,
      params: payload,
    );
  }

  static Future<Response> callPostApi({
    dynamic user,
    required String url,
    Map<String, dynamic>? payload,
  }) async {
    final http = HttpService(user: user);
    return await http.request(
      url: url,
      method: Method.post,
      params: payload,
    );
  }

  static Future<Response> callGetApi({
    dynamic user,
    required String url,
    Map<String, dynamic>? payload,
  }) async {
    final http = HttpService(user: user);
    return await http.request(
      url: url,
      method: Method.get,
      params: payload,
    );
  }

  static header() => {
        "Content-Type": "application/json",
        "X-Requested-With": "XMLHttpRequest",
      };

  HttpService({this.user}) {
    _dio = Dio(BaseOptions(baseUrl: _API_BASE_URL, headers: header()));
    initInterceptors();
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          if (user != null) {
            requestOptions.headers['Authorization'] = 'Bearer ${user!.token}';
          }

          debugPrint(
              "REQUEST[${requestOptions.method}] "
                  "\n ==> PATH: ${requestOptions.path}"
              "\n ==> REQUEST VALUES: ${requestOptions.data} "
                  "\n ==> REQUEST PARAMS: ${requestOptions.queryParameters}"
                  "\n ==> HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          debugPrint(
              "RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) {
          final errorMessage = err.response!.data?['error']?['message'] ??
              err.response!.data?['message'] ??
              'Error encountered with this request 😩';

          EasyLoading.showError(errorMessage);

          return handler.next(err);
        },
      ),
    );
  }

  Future<Response> request(
      {required String url,
      required Method method,
      dynamic params}) async {
    Response response;

    try {
      if (method == Method.post) {
        response = await _dio!.post(url, data: params);
      } else if (method == Method.delete) {
        response = await _dio!.delete(url);
      } else if (method == Method.patch) {
        response = await _dio!.patch(url, data: params);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response;
      }

      throw Exception('Something went wrong');

    } on SocketException catch (e) {
      debugPrint('$e');
      throw const SocketException("No Internet Connection");
    } on FormatException catch (e) {
      debugPrint('Format Exception ==> $e');
      throw const FormatException("Bad response format");
    } on DioError catch (e) {
      // if (e.response?.statusCode == 400) {
      //   throw Exception("Unauthorized");
      if (e.response?.statusCode == 401) {
        debugPrint('401 exception received.');
        throw Exception('401 exception received.');
      }
      // else if (e.response?.statusCode == 500) {
      //   throw Exception("Server Error");
      // }

      debugPrint('ERROR FLAGGED MESSAGE: ${e.message} :==> DATA: ${e.response?.data}');
      throw DioError(requestOptions: e.requestOptions, error: e.error, response: e.response);
    } catch (e) {
      debugPrint('general exception ==> $e');
      throw Exception("Something went wrong");
    }
  }
}

class ApiRequestModel {
  final String url;
  final Method method;
  final dynamic payload;

  ApiRequestModel({
    required this.url,
    this.method = Method.get,
    this.payload,
  });
}
