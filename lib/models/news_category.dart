class NewsCategory {
  int? id;
  String? newsCategoryName;
  String? description;

  int? status;

  NewsCategory({this.id, this.newsCategoryName, this.description, this.status});

  NewsCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newsCategoryName = json['news_category_name'];
    description = json['description'];

    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['news_category_name'] = this.newsCategoryName;
    data['description'] = this.description;

    data['status'] = this.status;
    return data;
  }
}
