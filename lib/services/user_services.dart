import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<User> getInfoUserbyId(int id) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrl.getUserById),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "user_id": id.toString(),
              }))
          .timeout(const Duration(seconds: 25));
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        return User.fromJson(jsonDecode(response.body));
      }
    } finally {}
  }

  static Future<List<User>> fetchListUserGameChallenge() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      var response = await http.get(
        Uri.parse(AppUrl.getListUserGameChallenge),
        headers: <String, String>{
          'Content-Type': 'charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Connection": "Keep-Alive",
          "Keep-Alive": "timeout=5, max=1000"
        },
      ).timeout(const Duration(seconds: 25));
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed.map<User>((json) => User.fromJson(json)).toList();
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }
}
