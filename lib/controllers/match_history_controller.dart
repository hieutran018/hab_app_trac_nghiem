import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/models/history_detail_challenge.dart';
import 'package:hab_app_trac_nghiem/models/match_history.dart';
import 'package:hab_app_trac_nghiem/models/match_history_single_detail.dart';
import 'package:hab_app_trac_nghiem/services/match_service.dart';

class MatchHistoryController extends GetxController {
  static var isLoad = false.obs;
  static var isLoaddetail = false.obs;
  static var lstMatch = [].obs;
  static var match;
  static var matchS;

  static Future<List<MatchHistory>> fetchMatchHistory(int id) async {
    try {
      isLoad.value = false;
      var lst = await MatchService.fetchMatchHistory(id);

      isLoad.value = true;
      lstMatch.assignAll(lst);
      print(lstMatch.length);

      return lst;
    } finally {
      isLoad.value = true;
    }
  }

  static Future<HistorySingleDetail> getDataMatchHistorySingleDetail(
      int matchId) async {
    print(matchId);
    try {
      isLoaddetail.value = false;
      match = await MatchService.getMatchHistorySinglebyId(matchId);
      isLoaddetail.value = true;
      print(['TEST MATCH', match]);
      return match;
    } finally {
      isLoaddetail.value = true;
    }
  }

  static Future<HistoryChallengeDetail> getDataMatchHistoryChallengeDetail(
      int matchId) async {
    try {
      isLoaddetail.value = false;
      matchS = await MatchService.getMatchHistoryChallengebyId(matchId);
      print(matchS);
      isLoaddetail.value = true;
      return match;
    } finally {
      isLoaddetail.value = true;
    }
  }
}
