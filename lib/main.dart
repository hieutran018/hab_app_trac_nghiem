import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hab_app_trac_nghiem/app/shared_preferences.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:hab_app_trac_nghiem/provider/authprovider.dart';
import 'package:hab_app_trac_nghiem/provider/user_provider.dart';
import 'package:hab_app_trac_nghiem/ui/main_screen.dart';
import 'package:hab_app_trac_nghiem/ui/news_detail_screen.dart';
import 'package:hab_app_trac_nghiem/ui/notification_screen.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/info_screen.dart';
import 'package:hab_app_trac_nghiem/ui/single_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/splash_screen.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/main_screen.dart';
import 'package:hab_app_trac_nghiem/ui/register_screen.dart';
import 'package:provider/provider.dart';
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
      child: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const FlashScreen(),
              routes: {
                '/login': (context) => const LoginScreen(),
                '/register': (context) => const RegisterScreen(),
                '/main': (context) => const MainScreen(),
                '/notification': (context) => const NotificationScreen(),
                NewsDetailScreen.route: (context) => const NewsDetailScreen(),
                SingleGameScreen.route: (context) => const SingleGameScreen(),
                InfoScreen.route: (context) => const InfoScreen(),
              },
            );
          }),
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
                return const MainScreen();
              }
          }
        });
  }
}
