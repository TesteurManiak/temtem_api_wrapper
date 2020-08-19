import 'package:temtem_api_wrapper/src/api_provider.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_character.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_condition.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_freetem.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_gear.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_item.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_quest.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_rewards.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_saipark.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_technique.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_tem.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_training_course.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_traits.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_type.dart';
import 'package:temtem_api_wrapper/src/provider/http_provider.dart';

class TemTemApi {
  final ApiProvider _provider;

  TemTemApi({ApiProvider provider = const HttpProvider()})
      : _provider = provider;

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

  Future<TemTemApiTem> getTemTem(int number,
      {List<String> fields = const [], List<String> expand = const []}) async {
    assert(number != null);
    final response =
        await _provider.getTemtem(number, fields: fields, expand: expand);
    return TemTemApiTem.fromJson(response);
  }

  Future<TemTemApiFreeTem> getFreeTem(String name, int level) async {
    assert(name != null);
    assert(level != null);
    final response = await _provider.getFreetem(name, level);
    return TemTemApiFreeTem.fromJson(response);
  }

  Future<List<TemTemApiRewards>> getFreeTemRewards() async {
    final response = await _provider.getFreetemRewards();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiRewards>((e) => TemTemApiRewards.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiType>> getTypes() async {
    final response = await _provider.getTypes();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiType>((e) => TemTemApiType.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiCondition>> getConditions() async {
    final response = await _provider.getConditions();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiCondition>((e) => TemTemApiCondition.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiTechnique>> getTechniques(
      {List<String> names = const [], List<String> fields = const []}) async {
    final response =
        await _provider.getTechniques(names: names, fields: fields);
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiTechnique>((e) => TemTemApiTechnique.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiTrainingCourse>> getTrainingCourses() async {
    final response = await _provider.getTrainingCourses();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiTrainingCourse>(
            (e) => TemTemApiTrainingCourse.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiTraits>> getTraits(
      {List<String> names = const [], List<String> fields = const []}) async {
    final response = await _provider.getTraits(names: names, fields: fields);
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiTraits>((e) => TemTemApiTraits.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiItem>> getItems() async {
    final response = await _provider.getItems();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiItem>((e) => TemTemApiItem.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiGear>> getGears() async {
    final response = await _provider.getGears();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiGear>((e) => TemTemApiGear.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiQuest>> getQuests() async {
    final response = await _provider.getQuests();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiQuest>((e) => TemTemApiQuest.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiCharacter>> getCharacters() async {
    final response = await _provider.getCharacters();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiCharacter>((e) => TemTemApiCharacter.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiSaipark>> getSaiparks() async {
    final response = await _provider.getSaiparks();
    final parsedData = response as List;
    return parsedData
        .map<TemTemApiSaipark>((e) => TemTemApiSaipark.fromJson(e))
        .toList();
  }
}
