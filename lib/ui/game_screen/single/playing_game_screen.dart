import 'package:bordered_text/bordered_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/controllers/level_controller.dart';
import 'package:hab_app_trac_nghiem/controllers/topic_question_controller.dart';
import 'package:hab_app_trac_nghiem/models/level.dart';
import 'package:hab_app_trac_nghiem/models/topic_question.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/dialog_exit_game.dart';

class PlayingSingleGameScreen extends StatefulWidget {
  const PlayingSingleGameScreen({Key? key}) : super(key: key);
  static String route = "/playingsinglegame";

  @override
  State<PlayingSingleGameScreen> createState() =>
      PlayingSingleGameScreenState();
}

class PlayingSingleGameScreenState extends State<PlayingSingleGameScreen> {
  var list = [];
  // ignore: unused_field
  final TopicQuestionController _topicQuestionController =
      Get.put(TopicQuestionController());
  // ignore: unused_field
  final LevelQuestionController _levelQuestionController =
      Get.put(LevelQuestionController());
  final GameController _gameController = Get.put(GameController());
  @override
  void initState() {
    super.initState();
    TopicQuestionController.getTopicbyId();
    LevelQuestionController.getLevelbyId();
    GameController.fetchDataQuestion();
    setState(() {
      list = GameController.list;
    });
    list = GameController.list;
    print(['screen', list[list.length - 1].questionContent]);
  }

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
                    color: ColorApp.lightGreen,
                  ),
                  child: BorderedText(
                    strokeWidth: 2.0.w,
                    strokeColor: ColorApp.white,
                    child: Text(
                      'Chơi Đơn',
                      style: GoogleFonts.inter(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorApp.blue6821,
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
                      child: FutureBuilder<TopicQuestion>(
                    future: TopicQuestionController.getTopicbyId(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                            "Chủ đề: ${snapshot.data?.topicQuestionName}",
                            style: GoogleFonts.inter(color: ColorApp.white));
                      } else {
                        return Text("Đang tải...",
                            style: GoogleFonts.inter(color: ColorApp.white));
                      }
                    },
                  )),
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
                  Obx(() {
                    if (GameController.isLoading.value) {
                      return CircularCountDownTimer(
                        duration: GameController.timeAnswer,
                        initialDuration: 0,
                        ringColor: ColorApp.white,
                        width: 60.w,
                        height: 60.w,
                        fillColor: ColorApp.red,
                        onStart: () {},
                        onComplete: () {},
                      );
                    } else {
                      return Container();
                    }
                  }),
                  Container(
                    width: 150.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: const Color.fromRGBO(118, 255, 207, 1),
                      border: Border.all(width: 2.w, color: ColorApp.blue),
                    ),
                    child: Center(child: Obx(() {
                      if (GameController.isLoading.value) {
                        return Text("1/${GameController.amountQuestion}",
                            style: GoogleFonts.inter(color: ColorApp.black));
                      } else {
                        return Text("Đang tải...",
                            style: GoogleFonts.inter(color: ColorApp.white));
                      }
                    })),
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
                  width: 1000.w,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(0, 41, 255, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(24.w))),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() {
                        if (GameController.isLoading.value) {
                          return Text(
                            "${GameController.list[0].questionContent} ",
                            style: GoogleFonts.inter(
                                fontSize: 30.sp, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          );
                        } else {
                          return Text(
                            "Đang tải câu hỏi",
                            style: GoogleFonts.inter(
                                fontSize: 30.sp, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          );
                        }
                      })),
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
                        child: InkWell(
                          onTap: () {},
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
