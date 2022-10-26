import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hab_app_trac_nghiem/app/shared_preferences.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:hab_app_trac_nghiem/provider/authprovider.dart';
import 'package:hab_app_trac_nghiem/provider/user_provider.dart';
import 'package:hab_app_trac_nghiem/ui/friend_screen/friend_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/challenger_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/playing_game_screen_challenger_mode.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/request_play_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/select_topic.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/playing_game_screen.dart';

import 'package:hab_app_trac_nghiem/ui/game_screen/single/select_topic.dart';
import 'package:hab_app_trac_nghiem/ui/info_user/info_user.dart';
import 'package:hab_app_trac_nghiem/ui/main_screen.dart';

import 'package:hab_app_trac_nghiem/ui/new_screen/news_detail_screen.dart';
import 'package:hab_app_trac_nghiem/ui/notification_screen/notification_screen.dart';
import 'package:hab_app_trac_nghiem/ui/friend_screen/request_friend_screen.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history_detail_single_game.dart';

import 'package:hab_app_trac_nghiem/ui/setting_screen/info_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/single_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/splash_screen/splash_screen.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/login_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/main_screen.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/register_screen.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
// import 'package:hab_app_trac_nghiem/ui/login_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/login_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/register_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

Future<User> getUserData() => UserPreferences().getUser();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const FlashScreen(),
        routes: {
          LoginScreen.route: (context) => const LoginScreen(),
          RegisterScreen.route: (context) => const RegisterScreen(),
          '/main': (context) => const MainScreen(),
          MainScreen.route: (context) => const MainScreen(),
          '/notification': (context) => const NotificationScreen(),
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
          RequestPlayGameScreen.route: (context) =>
              const RequestPlayGameScreen(),
          SelectTopicChallengerGameScreen.route: (context) =>
              const SelectTopicChallengerGameScreen(),
          PlayingChallengerGameScreen.route: (context) =>
              const PlayingChallengerGameScreen(),
          GameScreen.route: (context) => const GameScreen(),
          HistoryScreen.route: (context) => const HistoryScreen(),
          HistoryDetailSingleGame.route: (context) =>
              const HistoryDetailSingleGame(),
          InfoUserScreen.route: (context) => const InfoUserScreen(),
        },
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const CircularProgressIndicator();
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const LoginScreen();
              }
          }
        });
  }
}
