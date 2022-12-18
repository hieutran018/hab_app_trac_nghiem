import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:hab_app_trac_nghiem/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var loginProcess = false.obs;
  var registerProcess = false.obs;
  var error = "";
  var message = "";
  var logoutProcess = false.obs;
  static var id = 0;

  Future<String> login(String email, String password) async {
    error = "";
    try {
      loginProcess(true);
      List loginResp = await AuthService.loginEmailandPassword(email, password);
      if (loginResp[0] != "") {
        //success
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", loginResp[0]);
      } else {
        error = loginResp[1];
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }

  Future<String> loginWithGoogle() async {
    List endpoint = await AuthService.loginWithGoogle();
    return endpoint[0];
  }

  Future<String> register(
      String displayName, String email, String password) async {
    message = "";
    try {
      registerProcess(true);
      List register = await AuthService.registerEmailandPassword(
          displayName, email, password);
      if (register[0] != "") {
        //success
        message = register[1];
      } else {
        message = register[1];
      }
    } finally {
      registerProcess(false);
    }
    return message;
  }

  static Future<User> getDataUser(String token) async {
    User user = await AuthService.getUser(token);
    setId(user);
    return user;
  }

  static void setId(User user) {
    id = user.id!;
  }

  Future<bool> logOut() async {
    logoutProcess(false);
    try {
      final logout = await AuthService.logout();
      if (logout) {
        logoutProcess(true);
        return logout;
      } else {
        return logout;
      }
    } finally {
      logoutProcess(true);
    }
  }
}
