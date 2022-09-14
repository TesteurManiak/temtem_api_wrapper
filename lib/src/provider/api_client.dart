import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

abstract class ApiClient {
  Future<Object> get(Uri url);
}

class HttpClient implements ApiClient {
  HttpClient([http.Client? client]) : _client = client ?? http.Client();

  final http.Client _client;

  @override
  Future<Object> get(Uri url) async {
    final response = await _client.get(url);
    return jsonDecode(response.body) as Object;
  }
}

class DioClient implements ApiClient {
  DioClient([dio.Dio? client]) : client = client ?? dio.Dio();

  final dio.Dio client;

  @override
  Future<Object> get(Uri url) async {
    final response = await client.getUri(url);
    return response.data as Object;
  }
}
