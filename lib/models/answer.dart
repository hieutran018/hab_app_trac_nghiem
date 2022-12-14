class Answer {
  int? id;
  String? answerContent;
  int? isTrue;
  int? questionId;

  Answer({this.id, this.answerContent, this.isTrue, this.questionId});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answerContent = json['answer_content'];
    isTrue = json['isTrue'];
    questionId = json['question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer_content'] = answerContent;
    data['isTrue'] = isTrue;
    data['question_id'] = questionId;
    return data;
  }
}
