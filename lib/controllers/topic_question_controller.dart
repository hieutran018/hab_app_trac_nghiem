import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/models/topic_question.dart';
import 'package:hab_app_trac_nghiem/services/topic_question_services.dart';

class TopicQuestionController extends GetxController {
  static var isLoading = false.obs;
  static var listtp = [].obs;
  static var tpName;

  @override
  void onInit() {
    fetchDataTopicQuestion();
    super.onInit();
  }

  static Future<List<TopicQuestion>> fetchDataTopicQuestion() async {
    isLoading.value = false;
    try {
      var list = await TopicQuestionService.fetchTopicQuestion();
      listtp.assignAll(list);
      isLoading.value = true;
      return list;
    } finally {
      isLoading.value = true;
    }
  }

  static Future<TopicQuestion> getTopicbyId() async {
    try {
      var tp = await TopicQuestionService.getTopicbyId(GameController.idTopic);
      return tp;
    } finally {}
  }

  static getNameTopic(TopicQuestion tp) {
    tpName = tp.topicQuestionName!;
    return tpName;
  }
}
