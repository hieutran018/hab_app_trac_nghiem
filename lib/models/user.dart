class User {
  int? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? email;
  String? phone;
  String? address;
  String? dateOfBirth;
  int? lifeHeart;
  int? scoreSingle;
  int? scoreChallenge;
  int? rankingSingle;
  int? rankingChallenge;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.avatar,
      this.email,
      this.phone,
      this.address,
      this.dateOfBirth,
      this.lifeHeart,
      this.scoreSingle,
      this.scoreChallenge,
      this.rankingSingle,
      this.rankingChallenge});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    lifeHeart = json['life_heart'];
    scoreSingle = json['score_single'];
    scoreChallenge = json['score_challenge'];
    rankingSingle = json['ranking_single'];
    rankingChallenge = json['ranking_challenge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['date_of_birth'] = dateOfBirth;
    data['life_heart'] = lifeHeart;
    data['score_single'] = scoreSingle;
    data['score_challenge'] = scoreChallenge;
    data['ranking_single'] = rankingSingle;
    data['ranking_challenge'] = rankingChallenge;
    return data;
  }
}
