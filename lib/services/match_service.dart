import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/match_history.dart';
import 'package:hab_app_trac_nghiem/models/match_history_single_detail.dart';
import 'package:http/http.dart' as http;

class MatchService {
  static Future<List<MatchHistory>> fetchMatchHistory(int userId) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrl.fetchMatchHistory),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": userId.toString(),
              }))
          .timeout(const Duration(seconds: 25));

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed
            .map<MatchHistory>((json) => MatchHistory.fromJson(json))
            .toList();
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }

  static Future<HistorySingleDetail> getMatchHistorySinglebyId(
      int matchId) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrl.getMatchHistorySinglebyId),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "match_id": matchId.toString(),
              }))
          .timeout(const Duration(seconds: 25));

      if (response.statusCode == 200) {
        return HistorySingleDetail.fromJson(jsonDecode(response.body));
      } else {
        return HistorySingleDetail.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }

  static Future<HistorySingleDetail> getMatchHistoryChallengebyId(
      int matchId) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrl.getMatchHistoryChallengebyId),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "match_id": matchId.toString(),
              }))
          .timeout(const Duration(seconds: 25));

      if (response.statusCode == 200) {
        return HistorySingleDetail.fromJson(jsonDecode(response.body));
      } else {
        return HistorySingleDetail.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }
}
