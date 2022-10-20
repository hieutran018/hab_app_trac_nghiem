import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/challenger_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/single_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/roles_game.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

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
                  style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      color: const Color.fromRGBO(0, 41, 255, 1),
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
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 130.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: Colors.white,
                    border: Border.all(
                        width: 2.w, color: const Color.fromRGBO(5, 0, 255, 1)),
                  ),
                  child: Text(
                    "Lượt chơi: 3",
                    style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        color: const Color.fromRGBO(5, 0, 255, 1)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 130.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: const Color.fromRGBO(118, 255, 207, 1),
                    border: Border.all(
                        width: 2.w,
                        color: const Color.fromRGBO(118, 255, 70, 1)),
                  ),
                  child: Text(
                    "01 : 00 : 00",
                    style: GoogleFonts.inter(fontSize: 20.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(63.w, 2.h, 63.w, 0.h),
              child: const Divider(
                color: Color.fromRGBO(0, 0, 0, 1),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(SingleGameScreen.route);
              },
              child: const Text(
                "Chơi đơn",
                style: TextStyle(color: Color.fromRGBO(64, 82, 238, 1)),
              ),
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(169, 255, 139, 1),
                  padding:
                      EdgeInsets.symmetric(horizontal: 83.h, vertical: 7.w),
                  textStyle: GoogleFonts.inter(
                    fontSize: 32.sp,
                  ),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromRGBO(54, 237, 215, 1)),
                      borderRadius: BorderRadius.circular(24.w)))),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Thứ hạng"),
                  Image.asset("assets/images/components/ic_reward_no_1.png"),
                ],
              )),
          Text(
            "Điểm cao nhất: 1000",
            style: GoogleFonts.inter(fontSize: 14.sp),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(63.w, 2.h, 63.w, 0.h),
              child: const Divider(
                color: Color.fromRGBO(0, 0, 0, 1),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(ChallengerGameScreen.route);
              },
              child: Text(
                "Thách đấu",
                style: GoogleFonts.inter(
                    color: const Color.fromRGBO(238, 64, 64, 1)),
              ),
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(244, 207, 186, 1),
                  padding:
                      EdgeInsets.symmetric(horizontal: 83.w, vertical: 7.w),
                  textStyle: TextStyle(
                    fontSize: 32.w,
                  ),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromRGBO(54, 237, 215, 1)),
                      borderRadius: BorderRadius.circular(24.w)))),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Thứ hạng"),
                  Image.asset("assets/images/components/ic_reward_no_1.png"),
                ],
              )),
          Text(
            "Điểm cao nhất: 1000",
            style: GoogleFonts.inter(fontSize: 14.sp),
          ),
        ],
      )),
    );
  }
}
