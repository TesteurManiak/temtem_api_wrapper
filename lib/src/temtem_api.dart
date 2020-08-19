import 'dart:convert';

import 'package:temtem_api_wrapper/src/api_provider.dart';
import 'package:temtem_api_wrapper/src/model/temtem_api_tem.dart';

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
}
