import 'package:bordered_text/bordered_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/dialog_exit_game.dart';

class PlayingChallengerGameScreen extends StatefulWidget {
  const PlayingChallengerGameScreen({Key? key}) : super(key: key);
  static String route = "/playingchallengergame";

  @override
  State<PlayingChallengerGameScreen> createState() =>
      PlayingChallengerGameScreenState();
}

class PlayingChallengerGameScreenState
    extends State<PlayingChallengerGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    // _buildFailDialog();
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 50.w,
                    color: ColorApp.red,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.w, 12.h, 0.w, 0.h),
                child: Container(
                  width: 400.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: ColorApp.lightRed,
                  ),
                  child: BorderedText(
                    strokeWidth: 2.0.w,
                    strokeColor: ColorApp.white,
                    child: Text(
                      'Thách Đấu',
                      style: GoogleFonts.inter(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorApp.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 230.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: ColorApp.lightGreen4211,
                  ),
                  child: Center(
                    child: Text(
                      "Chủ đề: Khoa Học",
                      style: GoogleFonts.inter(
                          fontSize: 25.sp, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(100.w, 5.h, 100.w, 0.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: const Color.fromRGBO(118, 255, 207, 1),
                      border: Border.all(width: 2.w, color: ColorApp.blue),
                    ),
                    child: Center(
                      child: Text(
                        "Điểm: 100",
                        style: TextStyle(fontSize: 25.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  CircularCountDownTimer(
                    duration: 15,
                    initialDuration: 0,
                    ringColor: ColorApp.white,
                    width: 60.w,
                    height: 60.w,
                    fillColor: ColorApp.red,
                    onStart: () {
                      debugPrint('Countdown Started');
                    },
                    onComplete: () {
                      debugPrint('Countdown Ended');
                    },
                  ),
                  Container(
                    width: 150.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: const Color.fromRGBO(118, 255, 207, 1),
                      border: Border.all(width: 2.w, color: ColorApp.blue),
                    ),
                    child: Center(
                      child: Text(
                        "01/15",
                        style: TextStyle(fontSize: 25.sp),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 5.w),
                child: Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(0, 41, 255, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(24.w))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Cuộc gọi đầu tiên trên thế giới là giữa nhà phát minh Alexander Graham Bell và ...?",
                      style: GoogleFonts.inter(
                          fontSize: 30.sp, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8.w),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(5.w),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            color: const Color.fromRGBO(123, 120, 237, 1),
                          ),
                          child: SizedBox(
                              height: 100.h,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        20.w, 0.h, 10.w, 0.h),
                                    child: Text("A",
                                        style: GoogleFonts.inter(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w400,
                                            color: ColorApp.white)),
                                  ),
                                  Text("Bạn của ông",
                                      style: GoogleFonts.inter(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w400,
                                          color: ColorApp.white))
                                ],
                              )),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon:
                          Image.asset('assets/images/components/helper_50.png'),
                      onPressed: () {},
                      iconSize: 100.w,
                    ),
                    IconButton(
                      icon: Image.asset(
                          'assets/images/components/helper_swap.png'),
                      onPressed: () {},
                      iconSize: 100.w,
                    ),
                    IconButton(
                      icon: Image.asset(
                          'assets/images/components/helper_vote.png'),
                      onPressed: () {},
                      iconSize: 100.w,
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    ));
  }

  _buildFailDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ExitGameDialog();
        });
  }
}
