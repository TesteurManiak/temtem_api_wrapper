/// Astract class to use if you need to implement your own provider.
abstract class ApiProvider {
  Future<dynamic> getTemtems({
    List<String> names = const [],
    List<String> fields = const [],
    List<String> expand = const [],
  });
  Future<Map<String, dynamic>> getTemtem(
    int id, {
    List<String> fields = const [],
    List<String> expand = const [],
  });
  Future<Map<String, dynamic>> getFreetem(String name, int level);
  Future<dynamic> getFreetemRewards();
  Future<dynamic> getTypes();
  Future<dynamic> getConditions();
  Future<dynamic> getTechniques({
    List<String> names = const [],
    List<String> fields = const [],
  });
  Future<dynamic> getTrainingCourses();
  Future<dynamic> getTraits({
    List<String> names = const [],
    List<String> fields = const [],
  });
  Future<dynamic> getItems();
  Future<dynamic> getGears();
  Future<dynamic> getQuests();
  Future<dynamic> getCharacters();
  Future<dynamic> getSaiparks();
  Future<dynamic> getLocations();
  Future<dynamic> getCosmetics();
  Future<dynamic> getDyes();
  Future<dynamic> getPatches();
  Future<Map<String, dynamic>> getWeaknesses();
  Future<Map<String, dynamic>> calculateWeaknesses(
    String attacking,
    List<String> defending,
  );
  Future<dynamic> getBreeding();
}
