import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/controllers/ranking_single_controller.dart';
import 'package:http/http.dart' as http;

class GameService {
  static Future<bool> createDataGameSingle(
      String? token, int idTopic, int idLevel, int score) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrl.createGameSingle),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer $token',
              },
              body: jsonEncode(<String, String>{
                "topic_question_id": idTopic.toString(),
                "level_id": idLevel.toString(),
                "score": score.toString()
              }))
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
