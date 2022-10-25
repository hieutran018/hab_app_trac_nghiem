import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/challenger_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/single_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/roles_game.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  static String route = "/gamescreen";

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
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
                icon: Image.asset("assets/images/components/ic_history.png"),
              ),
              Text("Trắc Nghiệm Kiến Thức",
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
                icon: Image.asset("assets/images/components/ic_rules.png"),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(142.w, 0.h, 142.w, 0.h),
            child: CircleAvatar(
              radius: 50.w,
              backgroundImage:
                  const AssetImage("assets/images/components/avatar_1.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 150.w, right: 150.w, bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: Colors.white,
                    border: Border.all(width: 2.w, color: ColorApp.blue),
                  ),
                  child: Text(
                    "Lượt chơi: 3",
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
                    border: Border.all(width: 2.w, color: ColorApp.darkGreen),
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
                  "Thử Thách",
                  style: TextStyle(color: ColorApp.blue6821),
                ),
                style: ElevatedButton.styleFrom(
                    primary: ColorApp.lightGreen,
                    padding:
                        EdgeInsets.symmetric(horizontal: 83.h, vertical: 7.w),
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
                  const Text("Thứ hạng"),
                  Image.asset("assets/images/components/ic_reward_no_1.png"),
                ],
              )),
          Text(
            "Điểm cao nhất: 1000",
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
                  "Thách đấu",
                  style: GoogleFonts.inter(color: ColorApp.red),
                ),
                style: ElevatedButton.styleFrom(
                    primary: ColorApp.lightRed,
                    padding:
                        EdgeInsets.symmetric(horizontal: 83.w, vertical: 7.w),
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
                  const Text("Thứ hạng"),
                  Image.asset("assets/images/components/ic_reward_no_1.png"),
                ],
              )),
          Text(
            "Điểm cao nhất: 1000",
            style: GoogleFonts.inter(fontSize: 25.sp),
          ),
        ],
      )),
    );
  }
}
