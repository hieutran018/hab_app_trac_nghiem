class NewsCategory {
  int id;
  String newsCategoryName;
  String description;

  int status;

  NewsCategory(
      {required this.id,
      required this.newsCategoryName,
      required this.description,
      required this.status});

  factory NewsCategory.fromJson(Map<String, dynamic> json) {
    return NewsCategory(
      id: json['id'],
      newsCategoryName: json['news_category_name'],
      description: json['description'],
      status: json['status'],
    );
  }

  int? get _id => id;
  String? get _newsCategoryName => newsCategoryName;
  String? get _description => description;
  int? get _status => status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['news_category_name'] = _newsCategoryName;
    map['description'] = _description;
    map['status'] = _status;
    return map;
  }
}
