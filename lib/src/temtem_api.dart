import 'package:temtem_api_wrapper/src/api_provider.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_character.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_condition.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_cosmetic.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_dye.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_freetem.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_gear.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_item.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_location.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_patch.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_quest.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_rewards.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_saipark.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_technique.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_tem.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_training_course.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_traits.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_type.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_weakness.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_weakness_calc.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';

/// Base class used to manage all requests. You can pass a parameter [provider]
/// if you've made your own implementation of [ApiProvider].
class TemTemApi {
  final ApiProvider _provider;

  TemTemApi({ApiProvider provider = const HttpProvider()})
      : _provider = provider;

  /// Get informations for all available Temtems on the API.
  /// 
  /// [names] : A list of the Temtem names that you want information about.
  /// 
  /// [fields] : A list of fields you want returned.
  /// 
  /// [expand] : A list of fields you want extended.
  /// You can extend the trait, technique, and type fields, which then means
  /// they will return an array of data in the shape returned by the endpoints.
  Future<List<TemTemApiTem>> getTemTems({
    List<String> names = const [],
    List<String> fields = const [],
    List<String> expand = const [],
  }) async {
    final response = await _provider.getTemtems(
        names: names, fields: fields, expand: expand);
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiTem>((e) => TemTemApiTem.fromJson(e))
        .toList();
  }

  /// Get informations for a specific Temtem, specified by its [number].
  /// 
  /// [fields] : A list of fields you want returned.
  /// 
  /// [expand] : A list of fields you want extended.
  /// You can extend the trait, technique, and type fields, which then means
  /// they will return an array of data in the shape returned by the endpoints.
  Future<TemTemApiTem> getTemTem(int number,
      {List<String> fields = const [], List<String> expand = const []}) async {
    assert(number != null);
    final response =
        await _provider.getTemtem(number, fields: fields, expand: expand);
    return TemTemApiTem.fromJson(response);
  }

  /// Calculates the Freetem reward for catching a specific Temtem at a certain
  /// [level]. The Temtem parameter is the [name] of the temtem, it is case
  /// insensitive.
  Future<TemTemApiFreeTem> getFreeTem(String name, int level) async {
    assert(name != null);
    assert(level != null);
    final response = await _provider.getFreetem(name, level);
    return TemTemApiFreeTem.fromJson(response);
  }

  /// Get the rewards for the dynamic events of freeing Temtems.
  Future<List<TemTemApiRewards>> getFreeTemRewards() async {
    final response = await _provider.getFreetemRewards();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiRewards>((e) => TemTemApiRewards.fromJson(e))
        .toList();
  }

  /// Get informations on all available Temtem's types.
  Future<List<TemTemApiType>> getTypes() async {
    final response = await _provider.getTypes();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiType>((e) => TemTemApiType.fromJson(e))
        .toList();
  }

  /// Get informations on all available Temtem's conditions.
  Future<List<TemTemApiCondition>> getConditions() async {
    final response = await _provider.getConditions();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiCondition>((e) => TemTemApiCondition.fromJson(e))
        .toList();
  }

  /// Get informations on all available techniques.
  /// 
  /// [names] : A list of technique names that you want information about.
  /// 
  /// [fields] : A list of fields you want returned.
  Future<List<TemTemApiTechnique>> getTechniques(
      {List<String> names = const [], List<String> fields = const []}) async {
    final response =
        await _provider.getTechniques(names: names, fields: fields);
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiTechnique>((e) => TemTemApiTechnique.fromJson(e))
        .toList();
  }

  /// Get informations on all available training courses.
  Future<List<TemTemApiTrainingCourse>> getTrainingCourses() async {
    final response = await _provider.getTrainingCourses();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiTrainingCourse>(
            (e) => TemTemApiTrainingCourse.fromJson(e))
        .toList();
  }

  /// Get informations on all available Temtem's traits.
  /// 
  /// [names] : A list of trait names that you want information about.
  /// 
  /// [fields] : A list of fields you want returned.
  Future<List<TemTemApiTraits>> getTraits(
      {List<String> names = const [], List<String> fields = const []}) async {
    final response = await _provider.getTraits(names: names, fields: fields);
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiTraits>((e) => TemTemApiTraits.fromJson(e))
        .toList();
  }

  /// Get informations on all available items.
  Future<List<TemTemApiItem>> getItems() async {
    final response = await _provider.getItems();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiItem>((e) => TemTemApiItem.fromJson(e))
        .toList();
  }

  /// Get informations on all available gears.
  Future<List<TemTemApiGear>> getGears() async {
    final response = await _provider.getGears();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiGear>((e) => TemTemApiGear.fromJson(e))
        .toList();
  }

  /// Get informations on all available quests.
  Future<List<TemTemApiQuest>> getQuests() async {
    final response = await _provider.getQuests();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiQuest>((e) => TemTemApiQuest.fromJson(e))
        .toList();
  }

  /// Get informations on all available characters.
  Future<List<TemTemApiCharacter>> getCharacters() async {
    final response = await _provider.getCharacters();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiCharacter>((e) => TemTemApiCharacter.fromJson(e))
        .toList();
  }

  /// Get informations on all available saipark rotation.
  Future<List<TemTemApiSaipark>> getSaiparks() async {
    final response = await _provider.getSaiparks();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiSaipark>((e) => TemTemApiSaipark.fromJson(e))
        .toList();
  }

  /// Get informations on all available islands.
  Future<List<TemTemApiLocation>> getLocations() async {
    final response = await _provider.getLocations();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiLocation>((e) => TemTemApiLocation.fromJson(e))
        .toList();
  }

  /// Get informations on all available cosmetics.
  Future<List<TemTemApiCosmetic>> getCosmetics() async {
    final response = await _provider.getCosmetics();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiCosmetic>((e) => TemTemApiCosmetic.fromJson(e))
        .toList();
  }

  /// Get informations on all available dyes.
  Future<List<TemTemApiDye>> getDyes() async {
    final response = await _provider.getDyes();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiDye>((e) => TemTemApiDye.fromJson(e))
        .toList();
  }

  /// Get informations on all released patches.
  Future<List<TemTemApiPatch>> getPatches() async {
    final response = await _provider.getPatches();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiPatch>((e) => TemTemApiPatch.fromJson(e))
        .toList();
  }

  /// Get informations on all calculated weaknesses.
  Future<TemTemApiWeakness> getWeaknesses() async {
    final response = await _provider.getWeaknesses();
    return TemTemApiWeakness.fromJson(response);
  }

  /// Get the modifier of an attacking type on defending types.
  /// 
  /// [attacking] : A valid Temtem type to use as the attack value.
  /// 
  /// [defending] : A list of valid Temtem types to use as the defending values
  Future<TemTemApiWeaknessCalc> calculateWeakness(
      String attacking, List<String> defending) async {
    assert(attacking != null);
    assert(defending != null && defending.isNotEmpty);
    final response = await _provider.calculateWeaknesses(attacking, defending);
    return TemTemApiWeaknessCalc.fromJson(response);
  }

  /// This is work in progress
  Future<List> getBreeding() async {
    final response = await _provider.getBreeding();
    return response as List;
  }
}
