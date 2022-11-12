import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/ranking_challenge.dart';
import 'package:http/http.dart' as http;

class RankingChallengeService {
  static Future<List<RankingChallenge>> fetchRankingChallenge() async {
    try {
      var response = await http.get(Uri.parse(AppUrl.fetchRankingChallenge));
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed
            .map<RankingChallenge>((json) => RankingChallenge.fromJson(json))
            .toList();
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }
}
