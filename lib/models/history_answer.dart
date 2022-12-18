import 'package:hab_app_trac_nghiem/models/answer.dart';

class HistoryAnswer {
  List<Answer>? questionId;
  int? answerId;

  HistoryAnswer({this.questionId, this.answerId});

  HistoryAnswer.fromJson(Map<String, dynamic> json) {
    if (json['question_id'] != null) {
      questionId = <Answer>[];
      json['question_id'].forEach((v) {
        questionId!.add(Answer.fromJson(v));
      });
    }
    answerId = json['answer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (questionId != null) {
      data['question_id'] = questionId!.map((v) => v.toJson()).toList();
    }
    data['answer_id'] = answerId;
    return data;
  }
}
