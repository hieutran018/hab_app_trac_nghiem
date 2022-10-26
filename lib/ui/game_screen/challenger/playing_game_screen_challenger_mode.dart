import 'package:bordered_text/bordered_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayingChallengerGameScreen extends StatefulWidget {
  const PlayingChallengerGameScreen({Key? key}) : super(key: key);
  static String route = "/playingsinglegame";

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
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 50.w,
                    color: const Color.fromRGBO(235, 0, 0, 1),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: const Color.fromRGBO(4, 202, 133, 1),
                    border: Border.all(
                        width: 2.w,
                        color: const Color.fromRGBO(118, 255, 70, 1)),
                  ),
                  child: Text(
                    "Chủ đề: Khoa Học",
                    style:
                        GoogleFonts.inter(fontSize: 20.w, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 50.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Image.asset(
                            'assets/images/components/helper_50.png'),
                        onPressed: () {},
                        iconSize: 70.w,
                      ),
                      IconButton(
                        icon: Image.asset(
                            'assets/images/components/helper_swap.png'),
                        onPressed: () {},
                        iconSize: 70.w,
                      ),
                      IconButton(
                        icon: Image.asset(
                            'assets/images/components/helper_vote.png'),
                        onPressed: () {},
                        iconSize: 70.w,
                      ),
                    ],
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(25.w, 5.w, 25.w, 0.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      "Điểm: 100",
                      style: TextStyle(fontSize: 20.w),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CircularCountDownTimer(
                    duration: 15,
                    initialDuration: 0,
                    ringColor: const Color.fromRGBO(255, 255, 255, 1),
                    width: 60.w,
                    height: 60.w,
                    fillColor: const Color.fromRGBO(255, 0, 0, 1),
                    onStart: () {
                      debugPrint('Countdown Started');
                    },
                    onComplete: () {
                      debugPrint('Countdown Ended');
                    },
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
                      "Câu: 01/15",
                      style: TextStyle(fontSize: 20.w),
                      textAlign: TextAlign.center,
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
                  width: 400.w,
                  height: 150.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(0, 41, 255, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(24.w))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Cuộc gọi đầu tiên trên thế giới là giữa nhà phát minh Alexander Graham Bell và ...?",
                      style: GoogleFonts.inter(
                          fontSize: 20.w, fontWeight: FontWeight.w400),
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
                              width: 200.w,
                              height: 65.w,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        10.w, 0.w, 10.w, 0.w),
                                    child: Text("A",
                                        style: GoogleFonts.inter(
                                            fontSize: 20.w,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white)),
                                  ),
                                  Text("Bạn của ông",
                                      style: GoogleFonts.inter(
                                          fontSize: 20.w,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white))
                                ],
                              )),
                        ),
                      );
                    }),
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
