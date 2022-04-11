import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:temtem_api_wrapper/src/api_provider.dart';

import 'fixture_reader.dart';

class MockHttpProvider implements ApiProvider {
  @override
  Future<Map<String, dynamic>> calculateWeaknesses(
    String attacking,
    List<String> defending,
  ) {
    // TODO: implement calculateWeaknesses
    throw UnimplementedError();
  }

  @override
  Future getBreeding() {
    // TODO: implement getBreeding
    throw UnimplementedError();
  }

  @override
  Future getCharacters() {
    // TODO: implement getCharacters
    throw UnimplementedError();
  }

  @override
  Future getConditions() {
    // TODO: implement getConditions
    throw UnimplementedError();
  }

  @override
  Future getCosmetics() {
    // TODO: implement getCosmetics
    throw UnimplementedError();
  }

  @override
  Future getDyes() {
    // TODO: implement getDyes
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getFreetem(String name, int level) {
    // TODO: implement getFreetem
    throw UnimplementedError();
  }

  @override
  Future<Iterable> getFreetemRewards() {
    // TODO: implement getFreetemRewards
    throw UnimplementedError();
  }

  @override
  Future getGears() {
    // TODO: implement getGears
    throw UnimplementedError();
  }

  @override
  Future getItems() {
    // TODO: implement getItems
    throw UnimplementedError();
  }

  @override
  Future getLocations() {
    // TODO: implement getLocations
    throw UnimplementedError();
  }

  @override
  Future getPatches() {
    // TODO: implement getPatches
    throw UnimplementedError();
  }

  @override
  Future getQuests() {
    // TODO: implement getQuests
    throw UnimplementedError();
  }

  @override
  Future getSaiparks() {
    // TODO: implement getSaiparks
    throw UnimplementedError();
  }

  @override
  Future getTechniques({
    List<String> names = const [],
    List<String> fields = const [],
  }) {
    // TODO: implement getTechniques
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getTemtem({
    required int id,
    required List<ExpandableField> expand,
    required bool weaknesses,
  }) async {
    const listEquality = ListEquality();

    if (id == 113) {
      if (listEquality.equals(expand, ExpandableField.values) && !weaknesses) {
        return jsonDecode(fixture('temtem_113_expanded.json'))
            as Map<String, dynamic>;
      } else if (expand.isEmpty && weaknesses) {
        return jsonDecode(fixture('temtem_113_weaknesses.json'))
            as Map<String, dynamic>;
      }
      return jsonDecode(fixture('temtem_113.json')) as Map<String, dynamic>;
    }
    throw UnimplementedError();
  }

  @override
  Future<Iterable> getTemtems({
    required List<String> names,
    required List<ExpandableField> expand,
    required bool weaknesses,
  }) async {
    const listEquality = ListEquality();

    if (listEquality.equals(names, ['Ganki', 'Mimit']) &&
        expand.isEmpty &&
        !weaknesses) {
      final json = jsonDecode(fixture('temtems_2.json')) as Iterable;
      return json;
    } else if (listEquality.equals(names, ['Ganki']) &&
        listEquality.equals(expand, ExpandableField.values) &&
        !weaknesses) {
      final json = jsonDecode(fixture('temtems_3.json')) as Iterable;
      return json;
    } else if (names.isEmpty && expand.isEmpty && weaknesses) {
      final json = jsonDecode(fixture('temtems_4.json')) as Iterable;
      return json;
    }

    final json = jsonDecode(fixture('temtems.json')) as Iterable;
    return json;
  }

  @override
  Future getTrainingCourses() {
    // TODO: implement getTrainingCourses
    throw UnimplementedError();
  }

  @override
  Future getTraits({
    List<String> names = const [],
    List<String> fields = const [],
  }) {
    // TODO: implement getTraits
    throw UnimplementedError();
  }

  @override
  Future getTypes() {
    // TODO: implement getTypes
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getWeaknesses() {
    // TODO: implement getWeaknesses
    throw UnimplementedError();
  }
}
