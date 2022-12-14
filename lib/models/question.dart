import 'package:hab_app_trac_nghiem/models/answer.dart';

class Question {
  int? id;
  String? questionContent;
  int? topicId;
  int? levelId;
  List<Answer>? answer;

  Question(
      {this.id, this.questionContent, this.topicId, this.levelId, this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionContent = json['question_content'];
    topicId = json['topic_id'];
    levelId = json['level_id'];
    if (json['answer'] != null) {
      answer = <Answer>[];
      json['answer'].forEach((v) {
        answer!.add(Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question_content'] = questionContent;
    data['topic_id'] = topicId;
    data['level_id'] = levelId;
    if (answer != null) {
      data['answer'] = answer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
