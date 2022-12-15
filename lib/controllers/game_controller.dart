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
  static var item = 0;
  static var score = 0;
  static var point = 0;
  static var timeAnswer = 0;

  @override
  void onInit() {
    fetchDataQuestion();

    idLevel;
    idTopic;
    item;
    score;
    point;
    super.onInit();
  }

  static Future<List<Question>> fetchDataQuestion() async {
    try {
      isLoading.value = false;
      var listq = await QuestionService.fetchQuestion(idTopic, idLevel);
      list.assignAll(listq);
      amountQuestion = list.length;
      timeAnswer = LevelQuestionController.time;
      point = LevelQuestionController.point;
      // print(['point', point]);
      // print(['list', list[0].questionContent]);
      // print(['listq', listq.length]);
      isLoading.value = true;
      return listq;
    } finally {
      isLoading.value = true;
    }
  }

  static void startQuestion() {
    item = 0;
  }

  static void nextQUestion() {
    if (item < amountQuestion) {
      // print(['case 1', item]);
      item = item + 1;
    } else {
      item = item;
      // print(['case 2', item]);
    }
  }

  static void answerQuestion(int isTrue) {
    if (isTrue == 1) {
      score = score + point;
      // print(['controller score', score]);
    } else {}
  }
}
