import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/controllers/level_controller.dart';
import 'package:hab_app_trac_nghiem/controllers/topic_question_controller.dart';
import 'package:hab_app_trac_nghiem/models/question.dart';
import 'package:hab_app_trac_nghiem/models/topic_question.dart';
import 'package:hab_app_trac_nghiem/services/game_services.dart';
import 'package:hab_app_trac_nghiem/services/question_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameController extends GetxController {
  static late int idLevel;
  static late int idTopic;
  static late int idUserTo;
  static late int matchId;

  static var isLoading = false.obs;
  static var isLoadingSingle = false.obs;
  static var list = [].obs;
  static var amountQuestion = 0;
  static var tpName;
  static var item = 0;
  static var score = 0;
  static var currentScoreSingle = 0;
  static var point = 0;
  static var timeAnswer = LevelQuestionController.time;
  static var isStartTime = false;
  static var listAnswer = [].obs;

  @override
  void onInit() {
    fetchDataQuestion();
    fetchDataQuestionToNotification();
    idLevel;
    idTopic;
    item;
    score;
    point;
    timeAnswer = LevelQuestionController.time;
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
      isStartTime = true;
      return listq;
    } finally {
      isLoading.value = true;
    }
  }

  static Future<List<Question>> fetchDataQuestionToNotification() async {
    try {
      isLoading.value = false;
      var listq = await QuestionService.fetchQuestionToNotifiCation(matchId);
      var tp = LevelQuestionController.getLevelbyId();
      var lv = TopicQuestionController.getTopicbyId();
      list.assignAll(listq);
      amountQuestion = list.length;
      timeAnswer = LevelQuestionController.time;
      point = LevelQuestionController.point;
      tpName = TopicQuestionController.tpName;
      isLoading.value = true;
      isStartTime = true;
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

  static Future<bool> createGameSingle(
      int idTopic, int idLevel, int score) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    List jsonList = [];

    for (var answer in listAnswer) {
      Map<String, String> val = {
        'question_id': answer[0].toString(),
        'answer_id': answer[1].toString(),
      };
      jsonList.add(val);
    }
    try {
      // print(['controller save', token, idTopic, idLevel, score]);
      var postData = await GameService.createDataGameSingle(
          token, idTopic, idLevel, score, jsonList);
      return postData;
    } finally {
      // ignore: control_flow_in_finally
      return false;
    }
  }

  static Future<bool> createDataGameChallenge(
      int idTopic, int idLevel, int score) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    List jsonList = [];

    for (var answer in listAnswer) {
      Map<String, String> val = {
        'question_id': answer[0].toString(),
        'answer_id': answer[1].toString(),
      };
      jsonList.add(val);
    }

    try {
      var postData = await GameService.createDataGameChallenge(
          token, idUserTo, idTopic, idLevel, score, jsonList);
      return postData;
    } finally {}
  }

  static Future<bool> createDataAcceptGameChallenge(
      int idTopic, int idLevel, int score) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    List jsonList = [];

    for (var answer in listAnswer) {
      Map<String, String> val = {
        'question_id': answer[0].toString(),
        'answer_id': answer[1].toString(),
      };
      jsonList.add(val);
    }

    try {
      var postData = await GameService.createDataAcceptGameChallenge(
          token, score, jsonList);
      return postData;
    } finally {
      // ignore: control_flow_in_finally
      return false;
    }
  }

  static void setAnswer(int questionId, int answerId) {
    var item = [questionId.toString(), answerId.toString()];
    listAnswer.add(item);
  }
}
