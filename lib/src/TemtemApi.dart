import 'dart:convert';
import 'package:http/http.dart' as http;

class TemtemApi {
  final _baseUrl = "https://temtem-api.mael.tech";

  // Api's routes
  static final allTemtems = "/api/temtems";
  static final types = "/api/types";
  static final conditions = "/api/conditions";
  static final techniques = "/api/techniques";
  static final traits = "/api/traits";
  static final gear = "/api/gear";
  static final locations = "/api/locations";
  static final weaknesses = "/api/weaknesses";

  static String weaknessCalc(String attacking, List<String> defending) =>
      "/api/weaknesses/calculate?attacking=$attacking&defending=${defending.join(',')}";

  /// Make a GET request on the API's Url
  /// If response status is valid the method return the decoded
  /// [response.body].
  /// Else it will throw an [Exception].
  Future<dynamic> getRequest(String request) async {
    try {
      var response = await http.get("$_baseUrl$request");
      if (response.statusCode == 200)
        return jsonDecode(response.body);
      else
        throw Exception("Error GET request: $request");
    } catch (e) {
      throw Exception("Request: $request\nException: $e");
    }
  }
}
