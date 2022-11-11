import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:hab_app_trac_nghiem/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var loginProcess = false.obs;
  var registerProcess = false.obs;
  var error = "";
  var message = "";

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

  Future<String> register(
      String fName, String lName, String email, String password) async {
    message = "";
    try {
      registerProcess(true);
      List register = await AuthService.registerEmailandPassword(
          fName, lName, email, password);
      if (register[0] == "success") {
        //success
        message = register[1];
        print(message);
      } else {
        message = register[1];
        print(message);
      }
    } finally {
      registerProcess(false);
    }
    print(message);
    return message;
  }

  static Future<User> getDataUser(String token) async {
    User user = await AuthService.getUser(token);
    return user;
  }
}
