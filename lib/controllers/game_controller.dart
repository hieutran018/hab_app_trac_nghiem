import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/controllers/level_controller.dart';
import 'package:hab_app_trac_nghiem/models/question.dart';
import 'package:hab_app_trac_nghiem/services/question_services.dart';

class GameController extends GetxController {
  static late int idLevel;
  static late int idTopic;

  static var isLoading = false.obs;
  static var list = [].obs;
  static var amountQuestion = 0;
  static var timeAnswer = 0;

  @override
  void onInit() {
    fetchDataQuestion();
    super.onInit();
  }

  static Future<List<Question>> fetchDataQuestion() async {
    try {
      isLoading.value = false;
      var listq = await QuestionService.fetchQuestion(idTopic, idLevel);
      list.assignAll(listq);
      amountQuestion = list.length;
      timeAnswer = LevelQuestionController.time;
      print(['time-controller', timeAnswer]);
      print(['list', list[0].questionContent]);
      print(['listq', listq.length]);
      isLoading.value = true;
      return listq;
    } finally {
      isLoading.value = true;
    }
  }
}
