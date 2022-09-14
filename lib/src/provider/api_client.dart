import 'package:dio/dio.dart' as dio;

abstract class ApiClient {
  Future<Object> get(Uri url);
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
