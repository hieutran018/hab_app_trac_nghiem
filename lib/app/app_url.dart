class AppUrl {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static const String login = baseUrl + '/login';
  static const String loginGoogle = baseUrl + '/login-with-google';
  static const String logout = baseUrl + '/logout';
  static const String register = baseUrl + '/register-account';
  static const String newsCategory = baseUrl + '/news/news-category';
  static const String getUser = baseUrl + '/user';
  static const String fetchRankingChallenge = baseUrl + '/ranking-challenge';
  static const String fetchRankingSingle = baseUrl + '/ranking-single';
  static const String fetchTopicQuestion = baseUrl + '/topic-quesiton';
  static const String getTopicbyId = baseUrl + '/get-topic-by-id';
  static const String fetchLevelQuestion = baseUrl + '/level-quesiton';
  static const String getLevelbyId = baseUrl + '/get-level-by-id';
  static const String fetchQuestion = baseUrl + '/question';
  static const String createGameSingle = baseUrl + '/games/create-match-single';
}
