import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/models/level.dart';
import 'package:hab_app_trac_nghiem/services/level_question_services.dart';

class LevelQuestionController extends GetxController {
  static var isLoading = false.obs;
  static var listtp = [].obs;
  static var time = 0;
  static var amount = 0;
  static var point = 0;

  @override
  void onInit() {
    fetchDataLevelQuestion();
    getLevelbyId();
    super.onInit();
  }

  static Future<List<Level>> fetchDataLevelQuestion() async {
    isLoading.value = false;
    try {
      var list = await LevelQuestionService.fetchLevelQuestion();
      listtp.assignAll(list);
      isLoading.value = true;
      return list;
    } finally {
      isLoading.value = true;
    }
  }

  static Future<Level> getLevelbyId() async {
    try {
      var lv = await LevelQuestionService.getLevelbyId(GameController.idLevel);
      getTime(lv);
      return lv;
    } finally {}
  }

  static getTime(Level lv) {
    time = lv.timeAnswer!;
    return time;
  }

  static getPoint(Level lv) {
    point = lv.point!;
    return point;
  }
}
