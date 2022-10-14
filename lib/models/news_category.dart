class NewsCategory {
  final int id;
  final String categoryName;
  final String description;

  NewsCategory(
      {required this.id,
      required this.categoryName,
      required this.description});

  factory NewsCategory.fromJson(Map<String, dynamic> responseData) {
    return NewsCategory(
        id: responseData["id"],
        categoryName: responseData["categoryName"],
        description: responseData["description"]);
  }
}

class Data {
  final String id, categoryName, description;

  Data(this.id, this.categoryName, this.description);
}
