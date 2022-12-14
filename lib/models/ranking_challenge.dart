import 'package:hab_app_trac_nghiem/models/user.dart';

class RankingChallenge {
  int? id;
  int? userId;
  int? scoreChallenge;
  User? user;

  RankingChallenge({this.id, this.userId, this.scoreChallenge, this.user});

  RankingChallenge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    scoreChallenge = json['score_challenge'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['score_challenge'] = scoreChallenge;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
