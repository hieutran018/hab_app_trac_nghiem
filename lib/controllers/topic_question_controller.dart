import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/models/topic_question.dart';
import 'package:hab_app_trac_nghiem/services/topic_question_services.dart';

class TopicQuestionController extends GetxController {
  static var isLoading = false.obs;
  static var listtp = [].obs;

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
      print(["CONTROLLER", listtp]);
      isLoading.value = true;
      return list;
    } finally {
      isLoading.value = true;
    }
  }
}
