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
        print(["SERVICES", parsed]);
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
}
