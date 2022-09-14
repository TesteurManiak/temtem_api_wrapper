import 'package:temtem_api_wrapper/src/api_provider.dart';
import 'package:temtem_api_wrapper/src/provider/api_client.dart';

class HttpProvider implements ApiProvider {
  static const baseUrl = 'https://temtem-api.mael.tech';
  static final baseUri = Uri.parse(baseUrl);

  final ApiClient _client;

  HttpProvider({ApiClient? client}) : _client = client ?? HttpClient();

  @override
  Future<Iterable<Map<String, dynamic>>> getTemtems({
    required List<String> names,
    required List<ExpandableField> expand,
    required bool weaknesses,
  }) async {
    final uri = baseUri.replace(
      pathSegments: ['api', 'temtems'],
      queryParameters: {
        if (names.isNotEmpty) 'names': names.join(','),
        if (expand.isNotEmpty) 'expand': expand.map((e) => e.name).join(','),
        if (weaknesses) 'weaknesses': 'true',
      },
    );
    final response = await _client.get(uri);
    final data = (response as Iterable).cast<Map<String, dynamic>>();
    return data;
  }

  @override
  Future<Map<String, dynamic>> getTemtem({
    required int id,
    required List<ExpandableField> expand,
    required bool weaknesses,
  }) async {
    final uri = baseUri.replace(
      pathSegments: ['api', 'temtems', '$id'],
      queryParameters: {
        if (expand.isNotEmpty) 'expand': expand.map((e) => e.name).join(','),
        if (weaknesses) 'weaknesses': 'true',
      },
    );
    final response = await _client.get(uri);
    final data = response as Map<String, dynamic>;
    return data;
  }

  @override
  Future<Map<String, dynamic>> getFreetem(String name, int level) async {
    final uri = baseUri.replace(
      pathSegments: ['api', 'freetem', name, '$level'],
    );
    final response = await _client.get(uri);
    final data = response as Map<String, dynamic>;
    return data;
  }

  @override
  Future<Iterable> getFreetemRewards() async {
    final uri = baseUri.replace(pathSegments: ['freetem', 'rewards']);
    final response = await _client.get(uri);
    final data = (response as Iterable).cast<Map<String, dynamic>>();
    return data;
  }

  @override
  Future<dynamic> getTypes() async {
    final uri = baseUri.replace(pathSegments: ['types']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getConditions() async {
    final uri = baseUri.replace(pathSegments: ['conditions']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getTechniques({
    List<String> names = const [],
    List<String> fields = const [],
  }) {
    final uri = baseUri.replace(
      pathSegments: ['techniques'],
      queryParameters: {
        if (names.isNotEmpty) 'names': names.join(','),
        if (fields.isNotEmpty) 'fields': fields.join(','),
      },
    );
    return _client.get(uri);
  }

  @override
  Future<dynamic> getTrainingCourses() async {
    final uri = baseUri.replace(pathSegments: ['training-courses']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getTraits({
    List<String> names = const [],
    List<String> fields = const [],
  }) async {
    final uri = baseUri.replace(
      pathSegments: ['traits'],
      queryParameters: {
        if (names.isNotEmpty) 'names': fields.join(','),
      },
    );
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getItems() async {
    final uri = baseUri.replace(pathSegments: ['items']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getGears() async {
    final uri = baseUri.replace(pathSegments: ['gears']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getQuests() async {
    final uri = baseUri.replace(pathSegments: ['quests']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getCharacters() async {
    final uri = baseUri.replace(pathSegments: ['characters']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getSaiparks() async {
    final uri = baseUri.replace(pathSegments: ['saipark']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getLocations() async {
    final uri = baseUri.replace(pathSegments: ['locations']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getCosmetics() async {
    final uri = baseUri.replace(pathSegments: ['cosmetics']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getDyes() async {
    final uri = baseUri.replace(pathSegments: ['dyes']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<dynamic> getPatches() async {
    final uri = baseUri.replace(pathSegments: ['patches']);
    final response = await _client.get(uri);
    return response;
  }

  @override
  Future<Map<String, dynamic>> getWeaknesses() async {
    final uri = baseUri.replace(pathSegments: ['weaknesses']);
    final response = await _client.get(uri);
    final data = response as Map<String, dynamic>;
    return data;
  }

  @override
  Future<Map<String, dynamic>> calculateWeaknesses(
    String attacking,
    List<String> defending,
  ) async {
    final uri = baseUri.replace(
      pathSegments: ['weaknesses', 'calculate'],
      queryParameters: {
        'attacking': attacking,
        'defending': defending.join(','),
      },
    );
    final response = await _client.get(uri);
    final data = response as Map<String, dynamic>;
    return data;
  }

  @override
  Future<dynamic> getBreeding() async {
    final uri = baseUri.replace(pathSegments: ['breeding']);
    final response = await _client.get(uri);
    return response;
  }
}
