class Level {
  int? id;
  String? levelName;
  String? description;
  int? amountQuestion;
  int? timeAnswer;
  int? point;

  Level(
      {this.id,
      this.levelName,
      this.description,
      this.amountQuestion,
      this.timeAnswer,
      this.point});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    levelName = json['level_name'];
    description = json['description'];
    amountQuestion = json['amount_question'];
    timeAnswer = json['time_answer'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level_name'] = levelName;
    data['description'] = description;
    data['amount_question'] = amountQuestion;
    data['time_answer'] = timeAnswer;
    data['point'] = point;
    return data;
  }
}
