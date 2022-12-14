import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/topic_question.dart';
import 'package:http/http.dart' as http;

class TopicQuestionService {
  static Future<List<TopicQuestion>> fetchTopicQuestion() async {
    try {
      var response = await http.get(
        Uri.parse(AppUrl.fetchTopicQuestion),
      );

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed
            .map<TopicQuestion>((json) => TopicQuestion.fromJson(json))
            .toList();
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }

  static Future<TopicQuestion> getTopicbyId(int idTopic) async {
    try {
      var response = await http.post(Uri.parse(AppUrl.getTopicbyId),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, int>{
            'id_topic': idTopic,
          }));

      if (response.statusCode == 200) {
        return TopicQuestion.fromJson(jsonDecode(response.body));
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }
}
