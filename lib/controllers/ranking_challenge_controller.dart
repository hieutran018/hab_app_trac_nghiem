import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/models/ranking_challenge.dart';
import 'package:hab_app_trac_nghiem/services/ranking_challenge_service.dart';

class RankingChallengeController extends GetxController {
  static var isLoading = false.obs;
  static var listRank = [].obs;

  @override
  void onInit() {
    fetchDataRankingChallenge();
    super.onInit();
  }

  static Future<List<RankingChallenge>> fetchDataRankingChallenge() async {
    isLoading.value = false;
    try {
      var lstRank = await RankingChallengeService.fetchRankingChallenge();
      listRank.assignAll(lstRank);
      // print(["Controller", listRank]);
      return lstRank;
    } finally {
      isLoading.value = true;
    }
  }
}
