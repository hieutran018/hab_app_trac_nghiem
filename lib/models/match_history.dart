import 'package:hab_app_trac_nghiem/models/level.dart';
import 'package:hab_app_trac_nghiem/models/topic_question.dart';

class MatchHistory {
  int? id;
  int? userId;
  List<TopicQuestion>? topicQuestionId;
  List<Level>? levelId;
  int? gameMode;
  String? createdAt;

  MatchHistory(
      {this.id,
      this.userId,
      this.topicQuestionId,
      this.levelId,
      this.gameMode,
      this.createdAt});

  MatchHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    if (json['topic_question_id'] != null) {
      topicQuestionId = <TopicQuestion>[];
      json['topic_question_id'].forEach((v) {
        topicQuestionId!.add(TopicQuestion.fromJson(v));
      });
    }
    if (json['level_id'] != null) {
      levelId = <Level>[];
      json['level_id'].forEach((v) {
        levelId!.add(Level.fromJson(v));
      });
    }
    gameMode = json['game_mode'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    if (topicQuestionId != null) {
      data['topic_question_id'] =
          topicQuestionId!.map((v) => v.toJson()).toList();
    }
    if (levelId != null) {
      data['level_id'] = levelId!.map((v) => v.toJson()).toList();
    }
    data['game_mode'] = gameMode;
    data['created_at'] = createdAt;
    return data;
  }
}
