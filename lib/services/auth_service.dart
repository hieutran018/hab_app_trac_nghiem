import 'dart:convert';
import 'dart:io';

import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/models/auth.dart';
import 'package:hab_app_trac_nghiem/models/errors.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<List> loginEmailandPassword(
      String email, String password) async {
    try {
      var response = await http.post(Uri.parse(AppUrl.login),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(
              <String, String>{"email": email, "password": password}));
      if (response.statusCode == 200) {
        var json = response.body;
        var authRespo = loginRespFromJson(json);
        // ignore: unnecessary_null_comparison
        if (authRespo != null) {
          return [authRespo.accessToken, ""];
        } else {
          return ["", "Unknown Error"];
        }
      } else {
        var json = response.body;
        var errorResp = errorRespFromJson(json);
        // ignore: unnecessary_null_comparison
        if (errorResp == null) {
          return ["", "Unknown Error"];
        } else {
          return ["", errorResp.error];
        }
      }
    } catch (e) {
      return ["", "Kết nối thất bại!"];
    }
  }

  static Future<List> registerEmailandPassword(
      String fName, String lName, String email, String password) async {
    var response = await http.post(Uri.parse(AppUrl.register),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'first_name': fName,
          'last_name': lName,
          'email': email,
          'password': password
        }));
    if (response.statusCode == 200) {
      return ["", ""];
    } else {
      return ["", "Đăng ký thất bại, vui lòng thử lại sau!"];
    }
  }
}
