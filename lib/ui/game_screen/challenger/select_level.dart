import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/controllers/level_controller.dart';
import 'package:hab_app_trac_nghiem/controllers/topic_question_controller.dart';
import 'package:hab_app_trac_nghiem/models/level.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/playing_game_screen_challenger_mode.dart';
import 'package:lottie/lottie.dart';

class SelectLevelChallengeGameScreen extends StatefulWidget {
  const SelectLevelChallengeGameScreen({Key? key}) : super(key: key);
  static String route = "/selectlevelchallengegame";

  @override
  State<SelectLevelChallengeGameScreen> createState() =>
      SelectLevelChallengeGameScreenState();
}

class SelectLevelChallengeGameScreenState
    extends State<SelectLevelChallengeGameScreen> {
  LevelQuestionController controller = Get.put(LevelQuestionController());

  Future<List<Level>> _fetchLevelQuestion() async {
    dynamic lv = await LevelQuestionController.fetchDataLevelQuestion();
    return lv;
  }

  Future<bool> _refresh() async {
    _fetchLevelQuestion();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: ColorApp.blue),
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await _fetchLevelQuestion().then((lA) {
                if (lA is Future) {
                  setState(() {
                    _fetchLevelQuestion();
                  });
                  return;
                } else {
                  setState(() {
                    Get.defaultDialogTransitionDuration;
                  });
                  return;
                }
              });

              return;
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.navigate_before_sharp,
                            size: 50.w,
                            color: ColorApp.white,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 5.h),
                              child: Text(
                                "Ph???n ch??i TH??CH ?????U",
                                style: GoogleFonts.inter(
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.w400,
                                    color: ColorApp.white),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.w, 5.w, 0.w, 10.w),
                              child: Text(
                                "Ch???n ????? kh?? b???n mu???n <:",
                                style: GoogleFonts.inter(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w400,
                                    color: ColorApp.white),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 20.w, 8.w, 0.w),
                    child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.w),
                              topRight: Radius.circular(12.w)),
                        ),
                        child: Obx(() {
                          if (TopicQuestionController.isLoading.value) {
                            return ListView.builder(
                                padding:
                                    EdgeInsets.fromLTRB(4.w, 20.w, 4.w, 0.w),
                                itemCount:
                                    LevelQuestionController.listtp.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: EdgeInsets.all(5.w),
                                      child: Container(
                                        height: 230.h,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ColorApp.darkGrey),
                                            borderRadius:
                                                BorderRadius.circular(20.w),
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 1)),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ListTile(
                                                  title: Text(
                                                      "${LevelQuestionController.listtp[index].levelName}",
                                                      style: GoogleFonts.inter(
                                                          fontSize: 32.sp,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  subtitle: Column(
                                                    children: [
                                                      AutoSizeText(
                                                        "${LevelQuestionController.listtp[index].description}",
                                                        maxLines: 2,
                                                        minFontSize: 14,
                                                        maxFontSize: 17,
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 20.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: ColorApp
                                                                    .black),
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Row(
                                                        children: [
                                                          AutoSizeText(
                                                            "S??? c??u h???i: ${LevelQuestionController.listtp[index].amountQuestion}",
                                                            maxLines: 3,
                                                            minFontSize: 12,
                                                            maxFontSize: 15,
                                                            style: GoogleFonts.inter(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: ColorApp
                                                                    .blue),
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          AutoSizeText(
                                                            "Th???i gian tr??? l???i: ${LevelQuestionController.listtp[index].timeAnswer}",
                                                            maxLines: 3,
                                                            minFontSize: 12,
                                                            maxFontSize: 15,
                                                            style: GoogleFonts.inter(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: ColorApp
                                                                    .darkGreen),
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          AutoSizeText(
                                                            "??i???m m???i c??u: ${LevelQuestionController.listtp[index].point}",
                                                            maxLines: 3,
                                                            minFontSize: 12,
                                                            maxFontSize: 15,
                                                            style: GoogleFonts.inter(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: ColorApp
                                                                    .lightRed2251),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 8.h,
                                                          right: 8.w),
                                                      child: Container(
                                                        decoration: const BoxDecoration(
                                                            color: ColorApp
                                                                .lightBlue0121,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12))),
                                                        child: TextButton(
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                GameController
                                                                        .idLevel =
                                                                    LevelQuestionController
                                                                        .listtp[
                                                                            index]
                                                                        .id;
                                                              });
                                                              Navigator.of(
                                                                context,
                                                                rootNavigator:
                                                                    true,
                                                              ).pushNamed(
                                                                PlayingChallengerGameScreen
                                                                    .route,
                                                              );
                                                            },
                                                            child: Text(
                                                                "B???t ?????u",
                                                                style: GoogleFonts.inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        20.sp,
                                                                    color: ColorApp
                                                                        .white))),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ]),
                                      ));
                                });
                          } else {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(8.w, 20.w, 8.w, 0.w),
                              child: Column(
                                children: [
                                  Lottie.asset(
                                      'assets/images/components/loading_data.json'),
                                  Text(
                                    "??ang t??m ki???m ch??? ????? c??u h???i...",
                                    style: GoogleFonts.inter(
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.w700,
                                        color: ColorApp.blue6821),
                                  )
                                ],
                              ),
                            );
                          }
                        })),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
