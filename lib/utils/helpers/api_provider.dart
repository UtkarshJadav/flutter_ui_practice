

import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import '../../state/login_provider.dart';
import '../common/env.dart';

final Dio dio = Dio();

late Dio _dio;

class APIProvider {
  APIProvider(Reader read) {
    final BaseOptions dioOptions = BaseOptions()..baseUrl = env.baseurl;
    dioOptions.responseType = ResponseType.plain;
    dioOptions.connectTimeout = 200000;
    dioOptions.receiveTimeout = 200000;

    dioOptions.headers = {
      'Authorization': 'Bearer '+ read(authToken.state).state,
      'language': 'en',
      'cache-control': 'no-cache',
    };

    _dio = Dio(dioOptions);
  }

  Future<Response<dynamic>> getAPICall(String url) async {
    print(_dio.options.headers);
    final Response<dynamic> response = await _dio.get(url);
    throwIfNoSuccess(response);
    return response;
  }

  Future<Response<dynamic>> getAPICallWithQueryParam(
      String url, dynamic data) async {
    final Response<dynamic> response =
        await _dio.get(url, queryParameters: data as Map<String, dynamic>);
    throwIfNoSuccess(response);
    return response;
  }

  Future<Response<dynamic>> postAPICall(String url, dynamic data) async {
    final Response<dynamic> response = await _dio.post(url, data: data);
    throwIfNoSuccess(response);

    return response;
  }

  Future<Response<dynamic>> formDataPostAPICall(
      String url, dynamic data) async {
    final Response<dynamic> response = await _dio.post(url,
        data: data,
        options: Options(
          contentType: 'multipart/form-data',
        ));
    throwIfNoSuccess(response);
    return response;
  }

  Future<Response<dynamic>> formDataQueryPostAPICall(
      String url, dynamic data,dynamic queryParams) async {

    final Response<dynamic> response = await _dio.post(url+"$queryParams",
        data: FormData.fromMap(data as Map<String,dynamic>),
       );

    throwIfNoSuccess(response);
    return response;
  }

  Future<Response<dynamic>> deleteAPICall(String url) async {
    final Response<dynamic> response = await _dio.delete(url);
    throwIfNoSuccess(response);
    return response;
  }

  Future<Response<dynamic>> putAPICall(String url, dynamic data) async {
    final Response<dynamic> response = await _dio.put(url, data: data);
    throwIfNoSuccess(response);
    return response;
  }

  void throwIfNoSuccess(Response<dynamic> response) {
    int statusCode = response.statusCode ?? 0;
    if (statusCode < 200 || statusCode > 299) {
      throw HttpException(response);
    }
  }
}

class HttpException implements Exception {
  HttpException(this.response);

  Response<dynamic> response;
}
