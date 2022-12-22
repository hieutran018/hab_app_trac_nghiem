import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/match_history_controller.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history_detail_challenge.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history_detail_single_game.dart';
import 'package:lottie/lottie.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key, required this.idUser}) : super(key: key);
  static String route = '/historyscreen';
  final int idUser;
  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  final List<String> items = [
    'Thử Thách',
    'Thách Đấu',
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    MatchHistoryController.fetchMatchHistory(widget.idUser);
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
                  "Lịch sử trò chơi",
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
          if (MatchHistoryController.isLoad.value) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Icon(
                                Icons.list,
                                size: 16,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Tùy chọn',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: ColorApp.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: ColorApp.white,
                          iconDisabledColor: ColorApp.darkGrey,
                          buttonHeight: 50.h,
                          buttonWidth: 300.w,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: ColorApp.black,
                            ),
                            color: ColorApp.lightRed2251,
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 250.h,
                          dropdownWidth: 300.w,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: ColorApp.lightRed2251,
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-20, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.w, 0.h, 30.w, 10.h),
                  child: const Divider(
                    color: ColorApp.darkGrey,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(8.w),
                      itemCount: MatchHistoryController.lstMatch.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            MatchHistoryController.lstMatch[index].gameMode == 1
                                ? Get.to(
                                    () => HistoryDetailSingleGame(
                                        matchId: MatchHistoryController
                                            .lstMatch[index].id,
                                        mode: MatchHistoryController
                                            .lstMatch[index].gameMode),
                                  )
                                : Get.to(() => HistoryChallengeGame(
                                    matchId: MatchHistoryController
                                        .lstMatch[index].id,
                                    mode: MatchHistoryController
                                        .lstMatch[index].gameMode));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                color: ColorApp.lightBlue,
                              ),
                              child: SizedBox(
                                  width: 300.w,
                                  height: 150.h,
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: SizedBox(
                                                width: 150.w,
                                                child: AutoSizeText(
                                                  index % 2 == 0
                                                      ? "Thắng"
                                                      : "Thua",
                                                  maxFontSize: 25,
                                                  minFontSize: 19,
                                                  style: GoogleFonts.inter(
                                                      color: ColorApp
                                                          .lightBlue5125,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 40.sp),
                                                ),
                                              )),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: SizedBox(
                                                width: 150.w,
                                                child: AutoSizeText(
                                                  MatchHistoryController
                                                              .lstMatch[index]
                                                              .gameMode ==
                                                          1
                                                      ? 'Thử thách'
                                                      : 'Thách đấu',
                                                  maxFontSize: 16,
                                                  minFontSize: 15,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorApp.darkBlue,
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 30.w),
                                          child: SizedBox(
                                            width: 140.w,
                                            child: AutoSizeText(
                                              "${MatchHistoryController.lstMatch[index].topicQuestionId[0].topicQuestionName}",
                                              maxFontSize: 16,
                                              minFontSize: 15,
                                              style: GoogleFonts.inter(
                                                fontSize: 25.sp,
                                                fontWeight: FontWeight.w600,
                                                color: ColorApp.darkBlue,
                                              ),
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(left: 30.w),
                                          child: SizedBox(
                                            width: 150.w,
                                            child: AutoSizeText(
                                              "${MatchHistoryController.lstMatch[index].levelId[0].levelName}",
                                              maxFontSize: 16,
                                              minFontSize: 15,
                                              maxLines: 1,
                                              style: GoogleFonts.inter(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w600,
                                                color: ColorApp.darkBlue,
                                              ),
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(left: 20.w),
                                          child: SizedBox(
                                            width: 130.w,
                                            child: AutoSizeText(
                                              "${MatchHistoryController.lstMatch[index].createdAt}",
                                              maxFontSize: 16,
                                              minFontSize: 12,
                                              style: GoogleFonts.inter(
                                                fontSize: 22.sp,
                                                fontWeight: FontWeight.w600,
                                                color: ColorApp.darkBlue,
                                              ),
                                            ),
                                          )),
                                    ],
                                  )),
                            ),
                          ),
                        );
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
