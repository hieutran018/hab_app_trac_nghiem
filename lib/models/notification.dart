import 'package:hab_app_trac_nghiem/models/topic_question.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';

import 'level.dart';

class Notification {
  int? id;
  List<User>? userIdRequest;
  int? notificationId;
  List<User>? userIdConfirm;
  String? createdAt;
  String? updatedAt;
  int? matchId;
  int? status;
  List<Level>? levelId;
  List<TopicQuestion>? topicId;

  Notification(
      {this.id,
      this.userIdRequest,
      this.notificationId,
      this.userIdConfirm,
      this.matchId,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.levelId,
      this.topicId});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['user_id_request'] != null) {
      userIdRequest = <User>[];
      json['user_id_request'].forEach((v) {
        userIdRequest!.add(User.fromJson(v));
      });
    }
    notificationId = json['notification_id'];
    if (json['user_id_confirm'] != null) {
      userIdConfirm = <User>[];
      json['user_id_confirm'].forEach((v) {
        userIdConfirm!.add(User.fromJson(v));
      });
    }
    if (json['level_id'] != null) {
      levelId = <Level>[];
      json['level_id'].forEach((v) {
        levelId!.add(Level.fromJson(v));
      });
    }
    if (json['topic_id'] != null) {
      topicId = <TopicQuestion>[];
      json['topic_id'].forEach((v) {
        topicId!.add(TopicQuestion.fromJson(v));
      });
    }
    matchId = json['match_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (userIdRequest != null) {
      data['user_id_request'] = userIdRequest!.map((v) => v.toJson()).toList();
    }
    data['notification_id'] = notificationId;
    if (userIdConfirm != null) {
      data['user_id_confirm'] = userIdConfirm!.map((v) => v.toJson()).toList();
    }
    data['match_id'] = matchId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    return data;
  }
}
