import 'dart:convert';
// import 'dart:io';

// import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/models/auth.dart';
import 'package:hab_app_trac_nghiem/models/errors.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<List> loginEmailandPassword(
      String email, String password) async {
    try {
      var response = await http
          .post(Uri.parse(AppUrl.login),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8'
              },
              body: jsonEncode(
                  <String, String>{"email": email, "password": password}))
          .timeout(const Duration(seconds: 25));
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

  static Future<List> loginWithGoogle() async {
    final _googleSingIn = GoogleSignIn();
    Future<GoogleSignInAccount?> login() => _googleSingIn.signIn();
    final user = await login();
    var response = await http.post(Uri.parse(AppUrl.loginGoogle),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'email': user!.email,
          'provider_id': user.id,
          'display_name': user.displayName.toString()
        }));
    print(['1', jsonDecode(response.body)]);
    if (response.statusCode == 200) {
      return [''];
    } else {
      return ["error", "Đăng ký thất bại, vui lòng thử lại sau!"];
    }
  }

  static Future<List> registerEmailandPassword(
      String displayName, String email, String password) async {
    var response = await http.post(Uri.parse(AppUrl.register),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'display_name': displayName,
          'email': email,
          'password': password
        }));

    if (response.statusCode == 200) {
      return ["", ""];
    } else {
      return ["error", "Đăng ký thất bại, vui lòng thử lại sau!"];
    }
  }

  static Future<User> getUser(String token) async {
    try {
      var response = await http.get(Uri.parse(AppUrl.getUser), headers: {
        'Content-Type': 'charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000"
      });

      if (response.statusCode == 200) {
        var user = User.fromJson(jsonDecode(response.body));
        GameController.currentScoreSingle = user.scoreSingle!;
        return User.fromJson(jsonDecode(response.body));
      } else {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      return jsonDecode(e.toString());
    }
  }

  static Future<bool> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      var response = await http.post(Uri.parse(AppUrl.logout), headers: {
        'Content-Type': 'charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Connection": "Keep-Alive",
        "Keep-Alive": "timeout=5, max=1000"
      });

      if (response.statusCode == 200) {
        await prefs.remove('token');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
