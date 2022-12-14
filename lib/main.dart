import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hab_app_trac_nghiem/ui/friend_screen/friend_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/challenger_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/playing_game_screen_challenger_mode.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/request_play_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/select_level.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/select_topic.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/playing_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/select_level.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/select_topic.dart';
import 'package:hab_app_trac_nghiem/ui/info_user/info_user.dart';
import 'package:hab_app_trac_nghiem/ui/main_screen.dart';
import 'package:hab_app_trac_nghiem/ui/new_screen/news_detail_screen.dart';
import 'package:hab_app_trac_nghiem/ui/notification_screen/notification_screen.dart';
import 'package:hab_app_trac_nghiem/ui/friend_screen/request_friend_screen.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history_detail_challenge.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history_detail_single_game.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/info_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/single_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/splash_screen/splash_screen.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/login_screen.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/register_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FlashScreen(),
      routes: {
        LoginScreen.route: (context) => const LoginScreen(isScreen: false),
        RegisterScreen.route: (context) => const RegisterScreen(),
        '/main': (context) => const MainScreen(),
        MainScreen.route: (context) => const MainScreen(),
        NotificationScreen.route: (context) => const NotificationScreen(),
        NewsDetailScreen.route: (context) => const NewsDetailScreen(),
        SingleGameScreen.route: (context) => const SingleGameScreen(),
        InfoScreen.route: (context) => const InfoScreen(),
        FriendScreen.route: (context) => const FriendScreen(),
        RequestFriendScreen.route: (context) => const RequestFriendScreen(),
        SelectTopicSingleGameScreen.route: (context) =>
            const SelectTopicSingleGameScreen(),
        PlayingSingleGameScreen.route: (context) =>
            const PlayingSingleGameScreen(),
        ChallengerGameScreen.route: (context) => const ChallengerGameScreen(),
        RequestPlayGameScreen.route: (context) => const RequestPlayGameScreen(),
        SelectTopicChallengerGameScreen.route: (context) =>
            const SelectTopicChallengerGameScreen(),
        SelectLevelChallengeGameScreen.route: (context) =>
            const SelectLevelChallengeGameScreen(),
        PlayingChallengerGameScreen.route: (context) =>
            const PlayingChallengerGameScreen(screen: false),
        GameScreen.route: (context) => const GameScreen(),
        HistoryScreen.route: (context) => const HistoryScreen(idUser: 0),
        HistoryDetailSingleGame.route: (context) =>
            const HistoryDetailSingleGame(
              matchId: 0,
              mode: 0,
            ),
        HistoryChallengeGame.route: (context) => const HistoryChallengeGame(
              matchId: 0,
              mode: 0,
            ),
        InfoUserScreen.route: (context) => const InfoUserScreen(idUser: 0),
        SelectLevelSingleGameScreen.route: (context) =>
            const SelectLevelSingleGameScreen(),
      },
    );
  }
}
