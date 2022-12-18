import 'dart:convert';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/notification.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotifcationService {
  static Future<List<Notification>> fetchNotification() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      var response = await http.get(
        Uri.parse(AppUrl.notification),
        headers: <String, String>{
          'Content-Type': 'charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Connection": "Keep-Alive",
          "Keep-Alive": "timeout=5, max=1000"
        },
      );

      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return parsed
            .map<Notification>((json) => Notification.fromJson(json))
            .toList();
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }
}
