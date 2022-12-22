import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/match_history_controller.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:lottie/lottie.dart';

class HistoryChallengeGame extends StatefulWidget {
  const HistoryChallengeGame(
      {Key? key, required this.matchId, required this.mode})
      : super(key: key);
  static String route = 'historydetailchallenge';
  final int matchId;
  final int mode;
  @override
  State<HistoryChallengeGame> createState() => HistoryChallengeGameState();
}

class HistoryChallengeGameState extends State<HistoryChallengeGame> {
  @override
  void initState() {
    super.initState();
    MatchHistoryController.getDataMatchHistoryChallengeDetail(widget.matchId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.white,
          leading: const BackButton(
            color: ColorApp.black,
          ),
          title: Container(
            width: 250.w,
            height: 60.h,
            decoration: BoxDecoration(
              border: Border.all(color: ColorApp.white),
              color: ColorApp.blue,
              borderRadius: BorderRadius.circular(24.w),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(0.w, 3.w, 0.w, 3.w),
              child: Center(
                child: Text(
                  "Chi tiết trận đấu",
                  style:
                      GoogleFonts.inter(color: ColorApp.white, fontSize: 30.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Obx(() {
          if (MatchHistoryController.isLoaddetail.value) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0.h, 0.h, 20.w),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.w, 10.h, 0.w, 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Text(
                                  MatchHistoryController.matchS.gameMode == 1
                                      ? 'THỬ THÁCH'
                                      : 'THÁCH ĐẤU',
                                  style: GoogleFonts.inter(
                                      fontSize: 45.sp,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Text(
                                  "Chủ đề: ${MatchHistoryController.matchS.topicQuestion[0].topicQuestionName} - ${widget.matchId}",
                                  style: GoogleFonts.inter(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Text(
                                  "Độ khó: ${MatchHistoryController.matchS.levelQuestion[0].levelName}",
                                  style: GoogleFonts.inter(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w600)),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 10.h),
                            //   child: Text("Thời gian chơi: 00:05:01",
                            //       style: GoogleFonts.inter(
                            //           fontSize: 25.sp,
                            //           fontWeight: FontWeight.w600)),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Text(
                                  "Ngày: ${MatchHistoryController.matchS.createdAt}",
                                  style: GoogleFonts.inter(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Text(
                                  "Người thắng: ${MatchHistoryController.matchS.userIdWin ?? 'Chưa phân định'}",
                                  style: GoogleFonts.inter(
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                            "Điểm ${MatchHistoryController.matchS.userIdFrom[0].displayName}: ${MatchHistoryController.matchS.potinUserIdFrom}",
                            style: GoogleFonts.inter(
                                fontSize: 40.sp, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 10.h),
                  child: Divider(
                    height: 5.w,
                    color: ColorApp.darkGrey,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(8.w),
                      itemCount: MatchHistoryController
                          .matchS.historyAnswerFrom.length,
                      itemBuilder: (BuildContext context, int item) {
                        return Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                color: ColorApp.lightBlue,
                              ),
                              child: SizedBox(
                                // width: 300.w,
                                height: 150.h,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.w, 25.h, 50.w, 25.h),
                                      child: Container(
                                        width: 70.w,
                                        height: 100.h,
                                        decoration: const BoxDecoration(
                                          color: ColorApp.lightBlue5125,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: Text(
                                          "C${item + 1}",
                                          style: GoogleFonts.inter(
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.w700,
                                              color: ColorApp.white),
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: MatchHistoryController
                                            .matchS
                                            .historyAnswerFrom[item]
                                            .questionId
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  30.w, 20.h, 30.w, 20.h),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 70.w,
                                                    height: 70.w,
                                                    decoration: BoxDecoration(
                                                        color: MatchHistoryController
                                                                    .matchS
                                                                    .historyAnswerFrom[
                                                                        item]
                                                                    .questionId[
                                                                        index]
                                                                    .isTrue ==
                                                                1
                                                            ? ColorApp.red
                                                            : ColorApp.white,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: MatchHistoryController
                                                                      .matchS
                                                                      .historyAnswerFrom[
                                                                          item]
                                                                      .questionId[
                                                                          index]
                                                                      .id ==
                                                                  MatchHistoryController
                                                                      .matchS
                                                                      .historyAnswerFrom[
                                                                          item]
                                                                      .answerId
                                                              ? ColorApp.blue
                                                              : ColorApp.white,
                                                          width: MatchHistoryController
                                                                      .matchS
                                                                      .historyAnswerFrom[
                                                                          item]
                                                                      .questionId[
                                                                          index]
                                                                      .id ==
                                                                  MatchHistoryController
                                                                      .matchS
                                                                      .historyAnswerFrom[
                                                                          item]
                                                                      .answerId
                                                              ? 5.w
                                                              : 0.w,
                                                        )),
                                                    child: Center(
                                                        child: Text(
                                                      "${index + 1}",
                                                      style: GoogleFonts.inter(
                                                          fontSize: 30.sp,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )),
                                                  )
                                                ],
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      }),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                            "Điểm ${MatchHistoryController.matchS.userIdTo[0].displayName}: ${MatchHistoryController.matchS.potinUserIdTo}",
                            style: GoogleFonts.inter(
                                fontSize: 40.sp, fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(8.w),
                      itemCount:
                          MatchHistoryController.matchS.historyAnswerTo == null
                              ? 0
                              : MatchHistoryController
                                  .matchS.historyAnswerTo.length,
                      itemBuilder: (BuildContext context, int item) {
                        return Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                color: ColorApp.lightBlue,
                              ),
                              child: SizedBox(
                                // width: 300.w,
                                height: 150.h,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.w, 25.h, 50.w, 25.h),
                                      child: Container(
                                        width: 70.w,
                                        height: 100.h,
                                        decoration: const BoxDecoration(
                                          color: ColorApp.lightBlue5125,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: Text(
                                          "C${item + 1}",
                                          style: GoogleFonts.inter(
                                              fontSize: 30.sp,
                                              fontWeight: FontWeight.w700,
                                              color: ColorApp.white),
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: MatchHistoryController
                                            .matchS
                                            .historyAnswerTo[item]
                                            .questionId
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  30.w, 20.h, 30.w, 20.h),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 70.w,
                                                    height: 70.w,
                                                    decoration: BoxDecoration(
                                                        color: MatchHistoryController
                                                                    .matchS
                                                                    .historyAnswerTo[
                                                                        item]
                                                                    .questionId[
                                                                        index]
                                                                    .isTrue ==
                                                                1
                                                            ? ColorApp.red
                                                            : ColorApp.white,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: MatchHistoryController
                                                                      .matchS
                                                                      .historyAnswerTo[
                                                                          item]
                                                                      .questionId[
                                                                          index]
                                                                      .id ==
                                                                  MatchHistoryController
                                                                      .matchS
                                                                      .historyAnswerTo[
                                                                          item]
                                                                      .answerId
                                                              ? ColorApp.blue
                                                              : ColorApp.white,
                                                          width: MatchHistoryController
                                                                      .matchS
                                                                      .historyAnswerTo[
                                                                          item]
                                                                      .questionId[
                                                                          index]
                                                                      .id ==
                                                                  MatchHistoryController
                                                                      .matchS
                                                                      .historyAnswerTo[
                                                                          item]
                                                                      .answerId
                                                              ? 5.w
                                                              : 0.w,
                                                        )),
                                                    child: Center(
                                                        child: Text(
                                                      "${index + 1}",
                                                      style: GoogleFonts.inter(
                                                          fontSize: 30.sp,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )),
                                                  )
                                                ],
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      }),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset('assets/images/components/fetch_data.json'),
                Text(
                  'Đang tải dữ liệu...',
                  style: GoogleFonts.merriweather(
                      color: ColorApp.lightBlue5125,
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w700),
                ),
              ],
            );
          }
        }));
  }
}
