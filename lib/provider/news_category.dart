import 'dart:convert';
import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/news_category.dart';
import 'package:http/http.dart' as http;

class NewsCategoryProvider {
  // static List<NewsCategory> parseNewsCategory(String responseBody) {
  //   var list = json.encode(responseBody) as List<dynamic>;
  //   List<NewsCategory> newsCategory =
  //       list.map((model) => NewsCategory.fromJson(model)).toList();
  //   return newsCategory;
  // }

  // static Future<List<NewsCategory>> fetchNewsCategory() async {
  //   List<NewsCategory> postList = [];
  //   final resposne = await http.get(Uri.parse(AppUrl.newsCategory));
  //   var data = jsonDecode(resposne.body.toString());
  //   if (resposne.statusCode == 200) {
  //     postList.clear();
  //     for (Map i in data) {
  //       postList.add(NewsCategory.fromJson(i));
  //     }
  //     return postList;
  //   } else {
  //     return postList;
  //   }
  // }
}
