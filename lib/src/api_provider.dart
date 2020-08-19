import 'package:http/http.dart' as http;

class ApiProvider {
  static const _baseUrl = 'https://temtem-api.mael.tech/api';

  static Future<http.Response> getTemtems({
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

  static Future<http.Response> getTemtem(int id,
      {List<String> fields = const [], List<String> expand = const []}) {
    String url = '$_baseUrl/temtems/$id?';
    if (fields.isNotEmpty) url += 'fields=${fields.join(",")}';
    if (expand.isNotEmpty) {
      if (fields.isNotEmpty) url += '&';
      url += 'expand=${expand.join(",")}';
    }
    return _get(url);
  }

  static Future<http.Response> getFreetem(String name, int level) =>
      _get('$_baseUrl/freetem/$name/$level');
  static Future<http.Response> getFreetemRewards() =>
      _get('$_baseUrl/freetem/rewards');

  static Future<http.Response> getTypes() => _get('$_baseUrl/types');

  static Future<http.Response> getConditions() => _get('$_baseUrl/conditions');

  static Future<http.Response> getTechniques() => _get('$_baseUrl/techniques');

  static Future<http.Response> getTrainingCourses() =>
      _get('$_baseUrl/training-courses');

  static Future<http.Response> getTraits(
      {List<String> names = const [], List<String> fields = const []}) {
    String url = '$_baseUrl/traits?';
    for (int index = 0; index < names.length; index++) {
      url += '${names[index]}';
      if (index != names.length - 1) url += ',';
    }
    return _get(url);
  }

  static Future<http.Response> getItems() => _get('$_baseUrl/items');

  static Future<http.Response> getGears() => _get('$_baseUrl/gear');

  static Future<http.Response> getQuests() => _get('$_baseUrl/quests');

  static Future<http.Response> getAllCharacters() =>
      _get('$_baseUrl/characters');

  static Future<http.Response> getSaipark() => _get('$_baseUrl/saipark');

  static Future<http.Response> getLocations() => _get('$_baseUrl/locations');

  static Future<http.Response> getCosmetics() => _get('$_baseUrl/cosmetics');
  static Future<http.Response> getDyes() => _get('$_baseUrl/dyes');

  static Future<http.Response> getPatches() => _get('$_baseUrl/patches');

  static Future<http.Response> getWeaknesses() => _get('$_baseUrl/weaknesses');

  static Future<http.Response> calculateWeaknesses() => _get('$_baseUrl');

  static Future<http.Response> _get(String request) async {
    try {
      final response = await http.get(request);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Error GET request: $request');
      }
    } catch (e) {
      throw Exception('Request: $request\nException: $e');
    }
  }
}
