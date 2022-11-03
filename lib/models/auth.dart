import 'dart:convert';

AuthRespo loginRespFromJson(String str) => AuthRespo.fromJson(json.decode(str));

String loginRespToJson(AuthRespo data) => json.encode(data.toJson());

class AuthRespo {
  AuthRespo({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  String accessToken;
  String tokenType;
  int expiresIn;

  factory AuthRespo.fromJson(Map<String, dynamic> json) => AuthRespo(
      accessToken: json["access_token"],
      tokenType: json["token_type"],
      expiresIn: json["expires_in"]);

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn
      };
}
