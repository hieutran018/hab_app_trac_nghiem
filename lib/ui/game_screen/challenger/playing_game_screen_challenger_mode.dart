import 'package:auto_size_text/auto_size_text.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/controllers/level_controller.dart';
import 'package:hab_app_trac_nghiem/controllers/topic_question_controller.dart';
import 'package:hab_app_trac_nghiem/models/topic_question.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/dialog_end_game.dart';

class PlayingChallengerGameScreen extends StatefulWidget {
  const PlayingChallengerGameScreen({Key? key, required this.screen})
      : super(key: key);
  static String route = "/playingchallengergame";
  final bool screen;
  @override
  State<PlayingChallengerGameScreen> createState() =>
      PlayingChallengerGameScreenState();
}

class PlayingChallengerGameScreenState
    extends State<PlayingChallengerGameScreen> {
  var list = [];
  var start = true;
  var checkSelect = false;
  final CountDownController _controller = CountDownController();
  @override
  void initState() {
    super.initState();
    if (widget.screen) {
      // TopicQuestionController.getTopicbyId();
      // LevelQuestionController.getLevelbyId();
      GameController.fetchDataQuestionToNotification();
    } else {
      TopicQuestionController.getTopicbyId();
      LevelQuestionController.getLevelbyId();
      GameController.fetchDataQuestion();
    }

    setState(() {
      GameController.item = 0;
      GameController.score = 0;
      GameController.listAnswer.clear();
    });
    list = GameController.list;
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
                    child: Center(child: Obx(() {
                      if (GameController.isLoading.value) {
                        return Text(
                          "Điểm: ${GameController.score}",
                          style: TextStyle(fontSize: 25.sp),
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return Text(
                          "Đang tải...",
                          style: TextStyle(fontSize: 25.sp),
                          textAlign: TextAlign.center,
                        );
                      }
                    })),
                  ),
                  //! Bug: Lần đầu vào phần chơi chọn đáp án sẽ crash đơ app
                  Obx(() {
                    if (LevelQuestionController.isLoadLevel.value) {
                      return CircularCountDownTimer(
                        duration: GameController.timeAnswer,
                        initialDuration: 0,
                        ringColor: ColorApp.white,
                        width: 60.w,
                        height: 60.w,
                        fillColor: ColorApp.red,
                        isReverse: false,
                        onStart: () {
                          setState(() {
                            if (!checkSelect) {
                              if (start) {
                                GameController.item = 0;
                                start = false;
                              } else {
                                if (GameController.item <
                                    GameController.amountQuestion - 1) {
                                  GameController.item = GameController.item + 1;
                                  checkSelect = false;
                                } else {
                                  _buildEndGameChallengeDialog();
                                }
                              }
                            }
                          });
                        },
                        onComplete: () {
                          setState(() {
                            if (GameController.item <
                                GameController.amountQuestion) {
                              _controller.restart();
                            } else {
                              _buildEndGameChallengeDialog();
                            }
                            checkSelect = false;
                          });
                        },
                        controller: _controller,
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
                        return Text(
                            "${GameController.item + 1}/${GameController.amountQuestion}",
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
                            "${GameController.item + 1} - ${GameController.list[GameController.item].questionContent} ",
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
                          onTap: () {
                            GameController.answerQuestion(GameController
                                .list[GameController.item]
                                .answer[index]
                                .isTrue);
                            setState(() {
                              GameController.setAnswer(
                                  GameController.list[GameController.item].id,
                                  GameController.list[GameController.item]
                                      .answer[index].id);
                              if (GameController.item <
                                  GameController.amountQuestion - 1) {
                                GameController.nextQUestion();

                                checkSelect = true;
                                if (GameController.item ==
                                    GameController.amountQuestion) {
                                  _controller.pause();
                                } else {
                                  checkSelect = true;
                                  _controller.restart();
                                }
                              } else {
                                _controller.pause();
                                _buildEndGameChallengeDialog();
                              }
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                color: const Color.fromRGBO(123, 120, 237, 1),
                              ),
                              child: Obx(() {
                                if (GameController.isLoading.value) {
                                  return SizedBox(
                                    height: 100.h,
                                    child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            20.w, 30.h, 10.w, 0.h),
                                        child: AutoSizeText(
                                            "${index + 1} - ${GameController.list[GameController.item].answer[index].answerContent}",
                                            maxLines: 2,
                                            maxFontSize: 14,
                                            minFontSize: 12,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.inter(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w400,
                                                color: ColorApp.white))),
                                  );
                                } else {
                                  return Container();
                                }
                              })),
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

  _buildEndGameChallengeDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return EndGameChallengeDialog(screen: widget.screen);
        });
  }
}
