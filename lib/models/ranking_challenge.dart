import 'package:hab_app_trac_nghiem/models/user.dart';

class RankingChallenge {
  int? id;
  List<User>? userId;
  int? scoreSingle;
  int? scoreChallenge;

  RankingChallenge(
      {this.id, this.userId, this.scoreSingle, this.scoreChallenge});

  RankingChallenge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['user_id'] != null) {
      userId = <User>[];
      json['user_id'].forEach((v) {
        userId!.add(User.fromJson(v));
      });
    }
    scoreSingle = json['score_single'];
    scoreChallenge = json['score_challenge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (userId != null) {
      data['user_id'] = userId!.map((v) => v.toJson()).toList();
    }
    data['score_single'] = scoreSingle;
    data['score_challenge'] = scoreChallenge;
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
