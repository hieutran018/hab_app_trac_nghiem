import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/controllers/ranking_single_controller.dart';
import 'package:http/http.dart' as http;

class GameService {
  static Future<bool> createDataGameSingle(String? token, int idTopic,
      int idLevel, int score, List lstAnswer) async {
    try {
      Map data = {
        "topic_question_id": idTopic.toString(),
        "level_id": idLevel.toString(),
        "score": score.toString(),
        "list_answer": lstAnswer
      };
      var response = await http
          .post(Uri.parse(AppUrl.createGameSingle),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer $token',
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: 25));
      if (response.statusCode == 200) {
        RankingSingleController.fetchDataRankingSingle();
        return true;
      } else {
        return false;
      }
    } finally {}
  }

  static Future<bool> createDataGameChallenge(String? token, int userIdTo,
      int idTopic, int idLevel, int score, List lstAnswer) async {
    try {
      Map data = {
        "topic_question_id": idTopic.toString(),
        "level_id": idLevel.toString(),
        "user_id_to": userIdTo.toString(),
        "point_user_id_from": score.toString(),
        "list_answer": lstAnswer
      };
      var response = await http
          .post(Uri.parse(AppUrl.createGameChallenge),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer $token',
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: 25));
      if (response.statusCode == 200) {
        RankingSingleController.fetchDataRankingSingle();
        return true;
      } else {
        return false;
      }
    } finally {}
  }
}
