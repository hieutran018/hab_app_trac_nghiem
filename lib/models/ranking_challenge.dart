import 'package:hab_app_trac_nghiem/models/user.dart';

class RankingChallenge {
  int? id;
  int? userId;
  int? scoreSingle;
  int? scoreChallenge;
  User? user;

  RankingChallenge(
      {this.id, this.userId, this.scoreSingle, this.scoreChallenge, this.user});

  RankingChallenge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    scoreSingle = json['score_single'];
    scoreChallenge = json['score_challenge'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['score_single'] = scoreSingle;
    data['score_challenge'] = scoreChallenge;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

// class UserId {
//   int? id;
//   String? firstName;
//   String? lastName;
//   Null? avatar;

//   UserId({this.id, this.firstName, this.lastName, this.avatar});

//   UserId.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     avatar = json['avatar'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['avatar'] = this.avatar;
//     return data;
//   }
// }
