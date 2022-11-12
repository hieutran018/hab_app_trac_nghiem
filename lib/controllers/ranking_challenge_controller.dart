import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/models/ranking_challenge.dart';
import 'package:hab_app_trac_nghiem/services/ranking_challenge_service.dart';

class RankingChallengeController extends GetxController {
  static Future<List<RankingChallenge>> fetchDataRankingChallenge() async {
    try {
      var rank = await RankingChallengeService.fetchRankingChallenge();
      return rank;
    } finally {}
  }
}
