import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/models/ranking_single.dart';
import 'package:hab_app_trac_nghiem/services/ranking_single_service.dart';

class RankingSingleController extends GetxController {
  static var isLoading = false.obs;
  static var listRank = [].obs;

  @override
  void onInit() {
    fetchDataRankingSingle();
    super.onInit();
  }

  static Future<List<RankingSingle>> fetchDataRankingSingle() async {
    isLoading.value = false;
    try {
      var lstRank = await RankingSingleService.fetchRankingSingle();
      listRank.assignAll(lstRank);
      return lstRank;
    } finally {
      isLoading.value = true;
    }
  }
}
