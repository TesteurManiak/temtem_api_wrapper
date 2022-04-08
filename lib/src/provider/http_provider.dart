import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:temtem_api_wrapper/src/api_provider.dart';

class HttpProvider implements ApiProvider {
  static const _baseUrl = 'https://temtem-api.mael.tech/api';

  const HttpProvider();

  @override
  Future<Iterable> getTemtems({
    List<String> names = const [],
    List<String> fields = const [],
    List<String> expand = const [],
  }) {
    String url = '$_baseUrl/temtems?';
    if (names.isNotEmpty) url += 'name=${names.join(",")}';
    if (fields.isNotEmpty) {
      if (names.isNotEmpty) url += '&';
      url += 'fields=${fields.join(",")}';
    }
    if (expand.isNotEmpty) {
      if (names.isNotEmpty || fields.isNotEmpty) url += '&';
      url += 'expand=${expand.join(",")}';
    }
    return _get(url);
  }

  @override
  Future<Map<String, dynamic>> getTemtem(
    int id, {
    List<String> fields = const [],
    List<String> expand = const [],
  }) {
    String url = '$_baseUrl/temtems/$id?';
    if (fields.isNotEmpty) url += 'fields=${fields.join(",")}';
    if (expand.isNotEmpty) {
      if (fields.isNotEmpty) url += '&';
      url += 'expand=${expand.join(",")}';
    }
    return _get(url);
  }

  @override
  Future<Map<String, dynamic>> getFreetem(String name, int level) =>
      _get('$_baseUrl/freetem/$name/$level');

  @override
  Future<Iterable> getFreetemRewards() => _get('$_baseUrl/freetem/rewards');

  @override
  Future<dynamic> getTypes() => _get('$_baseUrl/types');

  @override
  Future<dynamic> getConditions() => _get('$_baseUrl/conditions');

  @override
  Future<dynamic> getTechniques({
    List<String> names = const [],
    List<String> fields = const [],
  }) {
    String url = '$_baseUrl/techniques?';
    if (names.isNotEmpty) url += 'names=${names.join(",")}';
    if (fields.isNotEmpty) {
      if (names.isNotEmpty) url += '&';
      url += 'fields=${fields.join(",")}';
    }
    return _get(url);
  }

  @override
  Future<dynamic> getTrainingCourses() => _get('$_baseUrl/training-courses');

  @override
  Future<dynamic> getTraits({
    List<String> names = const [],
    List<String> fields = const [],
  }) {
    final buffer = StringBuffer('$_baseUrl/traits?');
    for (int index = 0; index < names.length; index++) {
      buffer.write(names[index]);
      if (index != names.length - 1) buffer.write(',');
    }
    return _get(buffer.toString());
  }

  @override
  Future<dynamic> getItems() => _get('$_baseUrl/items');

  @override
  Future<dynamic> getGears() => _get('$_baseUrl/gear');

  @override
  Future<dynamic> getQuests() => _get('$_baseUrl/quests');

  @override
  Future<dynamic> getCharacters() => _get('$_baseUrl/characters');

  @override
  Future<dynamic> getSaiparks() => _get('$_baseUrl/saipark');

  @override
  Future<dynamic> getLocations() => _get('$_baseUrl/locations');

  @override
  Future<dynamic> getCosmetics() => _get('$_baseUrl/cosmetics');

  @override
  Future<dynamic> getDyes() => _get('$_baseUrl/dyes');

  @override
  Future<dynamic> getPatches() => _get('$_baseUrl/patches');

  @override
  Future<Map<String, dynamic>> getWeaknesses() => _get('$_baseUrl/weaknesses');

  @override
  Future<Map<String, dynamic>> calculateWeaknesses(
    String attacking,
    List<String> defending,
  ) {
    const baseRequest = '/weaknesses/calculate?attacking=';
    return _get(
      '$_baseUrl$baseRequest$attacking&defending=${defending.join(",")}',
    );
  }

  @override
  Future<dynamic> getBreeding() => _get('$_baseUrl/breeding');

  Future<T> _get<T>(String request) async {
    try {
      final response = await http.get(Uri.parse(request));
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
