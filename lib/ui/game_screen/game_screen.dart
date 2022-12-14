import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/auth_controller.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/challenger_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/single_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/login_screen.dart';
import 'package:hab_app_trac_nghiem/ui/roles_game.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  static String route = "/gamescreen";

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  final AuthController controller = Get.put(AuthController());

  static Future<bool> goto() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: goto(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Lottie.asset(
                    'assets/images/components/check_login_loading.json'));
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return const _GameScreen();
            } else {
              return const LoginScreen(
                isScreen: true,
              );
            }
          } else {
            print('ERROR');
            return const Center(
              child: Text('Oop!'),
            );
          }
        });
  }
}

class _GameScreen extends StatefulWidget {
  const _GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<_GameScreen> {
  int minutes = 1;
  int seconds = 60;
  Future<User> getInfoUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    dynamic user = await AuthController.getDataUser(token.toString());
    // print(user);
    return user;
  }

  @override
  void initState() {
    super.initState();
    getInfoUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: getInfoUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                            "assets/images/components/ic_history.png"),
                      ),
                      Text("Tr???c Nghi???m Ki???n Th???c",
                          style: GoogleFonts.inriaSans(
                              fontSize: 35.sp,
                              color: ColorApp.blue,
                              fontWeight: FontWeight.w900)),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const RolesGame();
                            },
                          );
                        },
                        icon: Image.asset(
                            "assets/images/components/ic_rules.png"),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(142.w, 0.h, 142.w, 0.h),
                    child: CircleAvatar(
                      radius: 50.w,
                      backgroundImage: NetworkImage(
                        "${snapshot.data.avatar}",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 150.w, right: 150.w, bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 160.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.w),
                            color: Colors.white,
                            border:
                                Border.all(width: 2.w, color: ColorApp.blue),
                          ),
                          child: Text(
                            'L?????t ch??i: ${snapshot.data.lifeHeart}',
                            style: GoogleFonts.inter(
                                fontSize: 25.sp, color: ColorApp.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 160.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.w),
                            color: ColorApp.white,
                            border: Border.all(
                                width: 2.w, color: ColorApp.darkGreen),
                          ),
                          child: Text(
                            "01 : 00 : 00",
                            style: GoogleFonts.inter(
                                fontSize: 25.sp, color: ColorApp.darkGreen),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(63.w, 50.h, 63.w, 25.h),
                      child: Divider(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        height: 2.h,
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushNamed(SingleGameScreen.route);
                        },
                        child: const Text(
                          "Th??? Th??ch",
                          style: TextStyle(color: ColorApp.blue6821),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorApp.lightGreen,
                            padding: EdgeInsets.symmetric(
                                horizontal: 83.h, vertical: 7.w),
                            textStyle: GoogleFonts.inter(
                              fontSize: 32.sp,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.w)))),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Th??? h???ng"),
                          snapshot.data.rankingSingle == 1
                              ? Image.asset(
                                  "assets/images/components/ic_reward_no_1.png",
                                  height: 50.h,
                                  width: 50.w,
                                )
                              : snapshot.data.rankingSingle == 2
                                  ? Image.asset(
                                      "assets/images/components/ic_reward_no_2.png",
                                      height: 50.h,
                                      width: 50.w,
                                    )
                                  : snapshot.data.rankingSingle == 3
                                      ? Image.asset(
                                          "assets/images/components/ic_reward_no_3.png",
                                          height: 50.h,
                                          width: 50.w,
                                        )
                                      : Text("${snapshot.data.rankingSingle}")
                        ],
                      )),
                  Text(
                    "??i???m cao nh???t: ${snapshot.data.scoreSingle}",
                    style: GoogleFonts.inter(fontSize: 25.sp),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(63.w, 50.h, 63.w, 25.h),
                      child: Divider(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        height: 2.h,
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushNamed(ChallengerGameScreen.route);
                        },
                        child: Text(
                          "Th??ch ?????u",
                          style: GoogleFonts.inter(color: ColorApp.red),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: ColorApp.lightRed,
                            padding: EdgeInsets.symmetric(
                                horizontal: 83.w, vertical: 7.w),
                            textStyle: TextStyle(
                              fontSize: 32.w,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.w)))),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Th??? h???ng"),
                          snapshot.data.rankingChallenge == 1
                              ? Image.asset(
                                  "assets/images/components/ic_reward_no_1.png",
                                  height: 50.h,
                                  width: 50.w,
                                )
                              : snapshot.data.rankingChallenge == 2
                                  ? Image.asset(
                                      "assets/images/components/ic_reward_no_2.png",
                                      height: 50.h,
                                      width: 50.w,
                                    )
                                  : snapshot.data.rankingChallenge == 3
                                      ? Image.asset(
                                          "assets/images/components/ic_reward_no_3.png",
                                          height: 50.h,
                                          width: 50.w,
                                        )
                                      : Text(
                                          "${snapshot.data.rankingChallenge}")
                        ],
                      )),
                  Text(
                    "??i???m cao nh???t: ${snapshot.data.scoreChallenge}",
                    style: GoogleFonts.inter(fontSize: 25.sp),
                  ),
                ],
              )),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Loi'),
            );
          } else {
            return Center(
                child: Padding(
              padding: EdgeInsets.fromLTRB(100.w, 0.h, 100.w, 0.h),
              child: LottieBuilder.asset(
                  'assets/images/components/game_loading.json'),
            ));
          }
        });
  }
}
