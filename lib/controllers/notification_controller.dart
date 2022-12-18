import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/models/notification.dart';
import 'package:hab_app_trac_nghiem/services/notification_services.dart';

class NotificationController extends GetxController {
  static var isLoading = false.obs;
  static var listNoti = [].obs;

  @override
  void onInit() {
    fetchDataNotification();
    super.onInit();
  }

  static Future<List<Notification>> fetchDataNotification() async {
    isLoading.value = false;
    try {
      var list = await NotifcationService.fetchNotification();
      listNoti.assignAll(list);
      return list;
    } finally {
      isLoading.value = true;
    }
  }
}
