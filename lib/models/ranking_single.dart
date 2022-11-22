import 'package:hab_app_trac_nghiem/models/user.dart';

class RankingSingle {
  int? id;
  int? userId;
  int? scoreSingle;
  User? user;

  RankingSingle({this.id, this.userId, this.scoreSingle, this.user});

  RankingSingle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    scoreSingle = json['score_single'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['score_single'] = scoreSingle;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
