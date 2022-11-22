class TopicQuestion {
  int? id;
  String? topicQuestionName;
  String? description;
  String? image;

  TopicQuestion(
      {this.id, this.topicQuestionName, this.description, this.image});

  TopicQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    topicQuestionName = json['topic_question_name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['topic_question_name'] = topicQuestionName;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
