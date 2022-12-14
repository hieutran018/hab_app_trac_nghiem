import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/level.dart';
import 'package:http/http.dart' as http;

class LevelQuestionService {
  static Future<List<Level>> fetchLevelQuestion() async {
    try {
      var response = await http.get(
        Uri.parse(AppUrl.fetchLevelQuestion),
      );

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

        return parsed.map<Level>((json) => Level.fromJson(json)).toList();
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }

  static Future<Level> getLevelbyId(int idLevel) async {
    try {
      var response = await http.post(Uri.parse(AppUrl.getLevelbyId),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, int>{
            'id_level': idLevel,
          }));

      if (response.statusCode == 200) {
        return Level.fromJson(jsonDecode(response.body));
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }
}
