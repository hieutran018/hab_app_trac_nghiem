import 'package:hab_app_trac_nghiem/models/history_answer.dart';
import 'package:hab_app_trac_nghiem/models/level.dart';
import 'package:hab_app_trac_nghiem/models/topic_question.dart';

class HistorySingleDetail {
  int? matchId;
  int? gameMode;
  List<TopicQuestion>? topicQuestion;
  List<Level>? levelQuestion;
  int? score;
  String? createdAt;
  List<HistoryAnswer>? historyAnswer;

  HistorySingleDetail(
      {this.matchId,
      this.gameMode,
      this.topicQuestion,
      this.levelQuestion,
      this.score,
      this.createdAt,
      this.historyAnswer});

  HistorySingleDetail.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    gameMode = json['game_mode'];
    if (json['topic_question'] != null) {
      topicQuestion = <TopicQuestion>[];
      json['topic_question'].forEach((v) {
        topicQuestion!.add(TopicQuestion.fromJson(v));
      });
    }
    if (json['level_question'] != null) {
      levelQuestion = <Level>[];
      json['level_question'].forEach((v) {
        levelQuestion!.add(Level.fromJson(v));
      });
    }
    score = json['score'];
    createdAt = json['created_at'];
    if (json['historyAnswer'] != null) {
      historyAnswer = <HistoryAnswer>[];
      json['historyAnswer'].forEach((v) {
        historyAnswer!.add(HistoryAnswer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['match_id'] = matchId;
    data['game_mode'] = gameMode;
    if (topicQuestion != null) {
      data['topic_question'] = topicQuestion!.map((v) => v.toJson()).toList();
    }
    if (levelQuestion != null) {
      data['level_question'] = levelQuestion!.map((v) => v.toJson()).toList();
    }
    data['score'] = score;
    data['created_at'] = createdAt;
    if (historyAnswer != null) {
      data['historyAnswer'] = historyAnswer!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}
