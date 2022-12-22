class AppUrl {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static const String login = baseUrl + '/login';
  static const String loginGoogle = baseUrl + '/login-with-google';
  static const String logout = baseUrl + '/logout';
  static const String register = baseUrl + '/register-account';
  static const String newsCategory = baseUrl + '/news/news-category';
  static const String getUser = baseUrl + '/user';
  static const String getUserById = baseUrl + '/user/get-data-user';
  static const String fetchRankingChallenge = baseUrl + '/ranking-challenge';
  static const String fetchRankingSingle = baseUrl + '/ranking-single';
  static const String fetchTopicQuestion = baseUrl + '/topic-quesiton';
  static const String getTopicbyId = baseUrl + '/get-topic-by-id';
  static const String fetchLevelQuestion = baseUrl + '/level-quesiton';
  static const String getLevelbyId = baseUrl + '/get-level-by-id';
  static const String fetchQuestion = baseUrl + '/question';
  static const String createGameSingle = baseUrl + '/games/create-match-single';
  static const String fetchMatchHistory = baseUrl + '/match-history';
  static const String getMatchHistorySinglebyId =
      baseUrl + '/match-history/history-detail';
  static const String getMatchHistoryChallengebyId =
      baseUrl + '/match-history/history-challenge-detail';
  static const String getListUserGameChallenge =
      baseUrl + '/games/get-list-user-game-challenge';
  static const String createGameChallenge =
      baseUrl + '/games/create-match-challenge';
  static const String notification = baseUrl + '/notification';
  static const String fetchQuestionAcceptChallenge =
      baseUrl + '/games/accept-game-challenge';
  static const String saveAcceptGameChallenge =
      baseUrl + '/games/create-accept-game-challenge';
}
