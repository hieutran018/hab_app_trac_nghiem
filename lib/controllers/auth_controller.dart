import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var loginProcess = false.obs;
  var error = "";

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
}
