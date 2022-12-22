import 'package:hab_app_trac_nghiem/models/history_answer.dart';
import 'package:hab_app_trac_nghiem/models/level.dart';
import 'package:hab_app_trac_nghiem/models/topic_question.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';

class HistoryChallengeDetail {
  int? matchId;
  List<User>? userIdFrom;
  List<User>? userIdTo;
  int? gameMode;
  List<TopicQuestion>? topicQuestion;
  List<Level>? levelQuestion;
  int? potinUserIdFrom;
  int? userIdWin;
  int? potinUserIdTo;
  String? createdAt;
  List<HistoryAnswer>? historyAnswerFrom;
  List<HistoryAnswer>? historyAnswerTo;

  HistoryChallengeDetail(
      {this.matchId,
      this.userIdFrom,
      this.userIdTo,
      this.gameMode,
      this.topicQuestion,
      this.levelQuestion,
      this.potinUserIdFrom,
      this.userIdWin,
      this.potinUserIdTo,
      this.createdAt,
      this.historyAnswerFrom,
      this.historyAnswerTo});

  HistoryChallengeDetail.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    if (json['user_id_from'] != null) {
      userIdFrom = <User>[];
      json['user_id_from'].forEach((v) {
        userIdFrom!.add(User.fromJson(v));
      });
    }
    if (json['user_id_to'] != null) {
      userIdTo = <User>[];
      json['user_id_to'].forEach((v) {
        userIdTo!.add(User.fromJson(v));
      });
    }
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
    potinUserIdFrom = json['potin_user_id_from'];
    userIdWin = json['user_id_win'];
    potinUserIdTo = json['potin_user_id_to'];
    createdAt = json['created_at'];
    if (json['historyAnswer_from'] != null) {
      historyAnswerFrom = <HistoryAnswer>[];
      json['historyAnswer_from'].forEach((v) {
        historyAnswerFrom!.add(HistoryAnswer.fromJson(v));
      });
    }
    if (json['historyAnswer_to'] != null) {
      historyAnswerTo = <HistoryAnswer>[];
      json['historyAnswer_to'].forEach((v) {
        historyAnswerTo!.add(HistoryAnswer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['match_id'] = matchId;
    if (userIdFrom != null) {
      data['user_id_from'] = userIdFrom!.map((v) => v.toJson()).toList();
    }
    if (userIdTo != null) {
      data['user_id_to'] = userIdTo!.map((v) => v.toJson()).toList();
    }
    data['game_mode'] = gameMode;
    if (topicQuestion != null) {
      data['topic_question'] = topicQuestion!.map((v) => v.toJson()).toList();
    }
    if (levelQuestion != null) {
      data['level_question'] = levelQuestion!.map((v) => v.toJson()).toList();
    }
    data['potin_user_id_from'] = potinUserIdFrom;
    data['user_id_win'] = userIdWin;
    data['potin_user_id_to'] = potinUserIdTo;
    data['created_at'] = createdAt;
    if (historyAnswerFrom != null) {
      data['historyAnswer_from'] =
          historyAnswerFrom!.map((v) => v.toJson()).toList();
    }
    if (historyAnswerTo != null) {
      data['historyAnswer_to'] =
          historyAnswerTo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
