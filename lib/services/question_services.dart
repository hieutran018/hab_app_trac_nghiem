import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/question.dart';
import 'package:http/http.dart' as http;

class QuestionService {
  static Future<List<Question>> fetchQuestion(int idTopic, int idLevel) async {
    try {
      var response = await http.post(Uri.parse(AppUrl.fetchQuestion),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, int>{
            'id_topic': idTopic,
            'id_level': idLevel,
          }));

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed.map<Question>((json) => Question.fromJson(json)).toList();
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }

  static Future<List<Question>> fetchQuestionToNotifiCation(int matchId) async {
    try {
      var response = await http.post(
          Uri.parse(AppUrl.fetchQuestionAcceptChallenge),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, int>{
            'match_id': matchId,
          }));

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        // print(parsed.map<Question>((json) => Question.fromJson(json)).toList());
        return parsed.map<Question>((json) => Question.fromJson(json)).toList();
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }
}
