import 'package:hab_app_trac_nghiem/models/user.dart';

class Notification {
  int? id;
  List<User>? userIdRequest;
  int? notificationId;
  List<User>? userIdConfirm;
  String? createdAt;
  String? updatedAt;
  int? status;

  Notification(
      {this.id,
      this.userIdRequest,
      this.notificationId,
      this.userIdConfirm,
      this.createdAt,
      this.updatedAt,
      this.status});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['user_id_request'] != null) {
      userIdRequest = <User>[];
      json['user_id_request'].forEach((v) {
        userIdRequest!.add(User.fromJson(v));
      });
    }
    notificationId = json['notification_id'];
    if (json['user_id_confirm'] != null) {
      userIdConfirm = <User>[];
      json['user_id_confirm'].forEach((v) {
        userIdConfirm!.add(User.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (userIdRequest != null) {
      data['user_id_request'] = userIdRequest!.map((v) => v.toJson()).toList();
    }
    data['notification_id'] = notificationId;
    if (userIdConfirm != null) {
      data['user_id_confirm'] = userIdConfirm!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    return data;
  }
}
