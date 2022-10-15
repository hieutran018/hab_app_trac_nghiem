import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/news_category.dart';
import 'package:http/http.dart' as http;

class NewsCategoryProvider {
  static List<NewsCategory> parseNewsCategory(String responseBody) {
    var list = json.encode(responseBody) as List<dynamic>;
    List<NewsCategory> newsCategory =
        list.map((model) => NewsCategory.fromJson(model)).toList();
    return newsCategory;
  }

  static Future<List<NewsCategory>> fetchNewsCategory() async {
    final response = await http.get(Uri.parse(AppUrl.newsCategory));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<String, dynamic>();

      return parsed
          .map<NewsCategory>((json) => NewsCategory.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
