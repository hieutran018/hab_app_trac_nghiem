import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/news_category.dart';
import 'package:http/http.dart' as http;

class NewsCategoryProvider {
  static Future<NewsCategory> fetchNewsCategory() async {
    final response = await http.get(Uri.parse(AppUrl.newsCategory));

    if (response.statusCode == 200) {
      return NewsCategory.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load news category!');
    }
  }
}
