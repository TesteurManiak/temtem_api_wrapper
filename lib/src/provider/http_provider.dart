import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:temtem_api_wrapper/src/api_provider.dart';

class HttpProvider implements ApiProvider {
  static const baseUrl = 'https://temtem-api.mael.tech';
  static final baseUri = Uri.parse(baseUrl);

  final http.Client _client;

  HttpProvider({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<Iterable> getTemtems({
    required List<String> names,
    required List<ExpandableField> expand,
    required bool weaknesses,
  }) {
    final uri = baseUri.replace(
      pathSegments: ['api', 'temtems'],
      queryParameters: {
        if (names.isNotEmpty) 'names': names.join(','),
        if (expand.isNotEmpty) 'expand': expand.map((e) => e.name).join(','),
        if (weaknesses) 'weaknesses': 'true',
      },
    );
    return _get(uri.toString());
  }

  @override
  Future<Map<String, dynamic>> getTemtem({
    required int id,
    required List<ExpandableField> expand,
    required bool weaknesses,
  }) {
    final uri = baseUri.replace(
      pathSegments: ['api', 'temtems', '$id'],
      queryParameters: {
        if (expand.isNotEmpty) 'expand': expand.map((e) => e.name).join(','),
        if (weaknesses) 'weaknesses': 'true',
      },
    );
    return _get(uri.toString());
  }

  @override
  Future<Map<String, dynamic>> getFreetem(String name, int level) {
    final uri = baseUri.replace(
      pathSegments: ['api', 'freetem', name, '$level'],
    );
    return _get(uri.toString());
  }

  @override
  Future<Iterable> getFreetemRewards() => _get('$baseUrl/freetem/rewards');

  @override
  Future<dynamic> getTypes() => _get('$baseUrl/types');

  @override
  Future<dynamic> getConditions() => _get('$baseUrl/conditions');

  @override
  Future<dynamic> getTechniques({
    List<String> names = const [],
    List<String> fields = const [],
  }) {
    String url = '$baseUrl/techniques?';
    if (names.isNotEmpty) url += 'names=${names.join(",")}';
    if (fields.isNotEmpty) {
      if (names.isNotEmpty) url += '&';
      url += 'fields=${fields.join(",")}';
    }
    return _get(url);
  }

  @override
  Future<dynamic> getTrainingCourses() => _get('$baseUrl/training-courses');

  @override
  Future<dynamic> getTraits({
    List<String> names = const [],
    List<String> fields = const [],
  }) {
    final buffer = StringBuffer('$baseUrl/traits?');
    for (int index = 0; index < names.length; index++) {
      buffer.write(names[index]);
      if (index != names.length - 1) buffer.write(',');
    }
    return _get(buffer.toString());
  }

  @override
  Future<dynamic> getItems() => _get('$baseUrl/items');

  @override
  Future<dynamic> getGears() => _get('$baseUrl/gear');

  @override
  Future<dynamic> getQuests() => _get('$baseUrl/quests');

  @override
  Future<dynamic> getCharacters() => _get('$baseUrl/characters');

  @override
  Future<dynamic> getSaiparks() => _get('$baseUrl/saipark');

  @override
  Future<dynamic> getLocations() => _get('$baseUrl/locations');

  @override
  Future<dynamic> getCosmetics() => _get('$baseUrl/cosmetics');

  @override
  Future<dynamic> getDyes() => _get('$baseUrl/dyes');

  @override
  Future<dynamic> getPatches() => _get('$baseUrl/patches');

  @override
  Future<Map<String, dynamic>> getWeaknesses() => _get('$baseUrl/weaknesses');

  @override
  Future<Map<String, dynamic>> calculateWeaknesses(
    String attacking,
    List<String> defending,
  ) {
    const baseRequest = '/weaknesses/calculate?attacking=';
    return _get(
      '$baseUrl$baseRequest$attacking&defending=${defending.join(",")}',
    );
  }

  @override
  Future<dynamic> getBreeding() => _get('$baseUrl/breeding');

  Future<T> _get<T>(String request) async {
    try {
      final response = await _client.get(Uri.parse(request));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as T;
      } else {
        throw Exception('Error GET request: $request');
      }
    } catch (e) {
      throw Exception('Request: $request\nException: $e');
    }
  }
}
