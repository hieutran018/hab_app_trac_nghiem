import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:hab_app_trac_nghiem/services/user_services.dart';

class UserController extends GetxController {
  static var isLoad = false.obs;
  // ignore: prefer_typing_uninitialized_variables
  static var dataUser;
  static var lstUser = [].obs;
  static var isLoadlstUser = false.obs;

  static Future<User> getUserbyId(int id) async {
    try {
      isLoad.value = false;
      var user = await UserService.getInfoUserbyId(id);
      // ignore: unnecessary_null_comparison
      if (user != null) {
        isLoad.value = true;
        dataUser = user;
        return user;
      } else {
        return user;
      }
    } finally {
      isLoad.value = true;
    }
  }

  static Future<List<User>> fetchListUserGameChallenge() async {
    isLoadlstUser.value = false;
    try {
      var list = await UserService.fetchListUserGameChallenge();
      lstUser.assignAll(list);
      isLoadlstUser.value = true;
      return list;
    } finally {
      isLoadlstUser.value = true;
    }
  }
}
