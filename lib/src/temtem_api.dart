import 'dart:convert';
import 'package:temtem_api_wrapper/src/api_provider.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_condition.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_freetem.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_rewards.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_technique.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_tem.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_type.dart';

class TemTemApi {
  Future<List<TemTemApiTem>> getTemTems({
    List<String> names = const [],
    List<String> fields = const [],
    List<String> expand = const [],
  }) async {
    final response = await ApiProvider.getTemtems(
        names: names, fields: fields, expand: expand);
    final parsedData = jsonDecode(response.body) as List;
    return parsedData
        .map<TemTemApiTem>((e) => TemTemApiTem.fromJson(e))
        .toList();
  }

  Future<TemTemApiTem> getTemTem(int number,
      {List<String> fields = const [], List<String> expand = const []}) async {
    assert(number != null);
    final response =
        await ApiProvider.getTemtem(number, fields: fields, expand: expand);
    return TemTemApiTem.fromJson(jsonDecode(response.body));
  }

  Future<TemTemApiFreeTem> getFreeTem(String name, int level) async {
    assert(name != null);
    assert(level != null);
    final response = await ApiProvider.getFreetem(name, level);
    return TemTemApiFreeTem.fromJson(jsonDecode(response.body));
  }

  Future<List<TemTemApiRewards>> getFreeTemRewards() async {
    final response = await ApiProvider.getFreetemRewards();
    final parsedData = jsonDecode(response.body) as List;
    return parsedData
        .map<TemTemApiRewards>((e) => TemTemApiRewards.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiType>> getTypes() async {
    final response = await ApiProvider.getTypes();
    final parsedData = jsonDecode(response.body) as List;
    return parsedData
        .map<TemTemApiType>((e) => TemTemApiType.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiCondition>> getConditions() async {
    final response = await ApiProvider.getConditions();
    final parsedData = jsonDecode(response.body) as List;
    return parsedData
        .map<TemTemApiCondition>((e) => TemTemApiCondition.fromJson(e))
        .toList();
  }

  Future<List<TemTemApiTechnique>> getTechniques(
      {List<String> names = const [], List<String> fields = const []}) async {
    final response =
        await ApiProvider.getTechniques(names: names, fields: fields);
    final parsedData = jsonDecode(response.body) as List;
    return parsedData.map((e) => TemTemApiTechnique.fromJson(e)).toList();
  }
}
