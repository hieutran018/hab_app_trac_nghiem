import 'package:auto_size_text/auto_size_text.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/ranking_single_controller.dart';
import 'package:hab_app_trac_nghiem/models/ranking_single.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/roles_game_single.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/select_level.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/select_topic.dart';
import 'package:hab_app_trac_nghiem/ui/home_screen/home_screen.dart';
import 'package:hab_app_trac_nghiem/ui/main_screen.dart';
import 'package:shimmer/shimmer.dart';

class SingleGameScreen extends StatefulWidget {
  const SingleGameScreen({Key? key}) : super(key: key);
  static String route = "/signlegame";

  @override
  State<SingleGameScreen> createState() => SingleGameScreenState();
}

class SingleGameScreenState extends State<SingleGameScreen> {
  final RankingSingleController controller = Get.put(RankingSingleController());

  Future<List<RankingSingle>> _fetchRankingSingle() async {
    dynamic rank = await RankingSingleController.fetchDataRankingSingle();
    debugPrint(rank[1].user.avatar);
    return rank;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.lightBlue5125,
          leading: const BackButton(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          title: Image.asset(
            "assets/images/components/ic_logo_hab.png",
            width: 45.w,
            height: 55.w,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const RolesSingleGame();
                  },
                );
              },
              icon: Image.asset("assets/images/components/ic_rules.png"),
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: RefreshIndicator(
              onRefresh: () async {
                await _fetchRankingSingle().then((lA) {
                  if (lA is Future) {
                    setState(() {
                      _fetchRankingSingle();
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
                              'Thử Thách',
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
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 160.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.w),
                            color: ColorApp.white,
                            border:
                                Border.all(width: 2.w, color: ColorApp.blue),
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
                    padding: EdgeInsets.fromLTRB(6.w, 5.h, 6.w, 0.h),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height <= 1280.h
                              ? 850.h
                              : 950.h,
                          color: ColorApp.lightGrey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 400.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.w),
                                  color: ColorApp.white,
                                  border: Border.all(
                                      width: 2.w, color: ColorApp.red),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(3.w, 10.h, 3.w, 10.h),
                                  child: Text(
                                    "NGƯỜI CHƠI DẪN ĐẦU",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 32.sp,
                                        color: ColorApp.red,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height <=
                                          1280.h
                                      ? 770.h
                                      : 870.h,
                                  child: Obx(() {
                                    if (RankingSingleController
                                        .isLoading.value) {
                                      return ListView.builder(
                                          padding: EdgeInsets.all(8.w),
                                          itemCount: RankingSingleController
                                              .listRank.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: EdgeInsets.all(5.w),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.w),
                                                  color: ColorApp.lightBlue,
                                                ),
                                                child: SizedBox(
                                                    width: 300.w,
                                                    height: 100.h,
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10.w),
                                                            child: SizedBox(
                                                              width: 50.w,
                                                              child: index == 0
                                                                  ? Image.asset(
                                                                      "assets/images/components/ic_reward_no_1.png",
                                                                      height:
                                                                          50.h,
                                                                      width:
                                                                          50.w,
                                                                    )
                                                                  : index == 1
                                                                      ? Image
                                                                          .asset(
                                                                          "assets/images/components/ic_reward_no_2.png",
                                                                          height:
                                                                              50.h,
                                                                          width:
                                                                              50.w,
                                                                        )
                                                                      : index ==
                                                                              2
                                                                          ? Image
                                                                              .asset(
                                                                              "assets/images/components/ic_reward_no_3.png",
                                                                              height: 50.h,
                                                                              width: 50.w,
                                                                            )
                                                                          : Text(
                                                                              '${index + 1}',
                                                                              style: GoogleFonts.inter(fontSize: 25.sp),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                            )),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.w),
                                                          child: CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      '${RankingSingleController.listRank[index].user.avatar}',
                                                                      scale:
                                                                          0.5)),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.w),
                                                          child: SizedBox(
                                                            width: 410.w,
                                                            child: AutoSizeText(
                                                              "${RankingSingleController.listRank[index].user.displayName}",
                                                              maxLines: 1,
                                                              maxFontSize: 17,
                                                              minFontSize: 10,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .inter(
                                                                fontSize: 22.sp,
                                                                color: index ==
                                                                        0
                                                                    ? ColorApp
                                                                        .red
                                                                    : ColorApp
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.w),
                                                          child: AutoSizeText(
                                                            "${RankingSingleController.listRank[index].scoreSingle}",
                                                            maxLines: 1,
                                                            minFontSize: 10,
                                                            maxFontSize: 20,
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontSize: 30.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: index == 0
                                                                  ? ColorApp.red
                                                                  : ColorApp
                                                                      .black,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            );
                                          });
                                    } else {
                                      return Shimmer.fromColors(
                                          baseColor: ColorApp.lightBlue,
                                          highlightColor:
                                              ColorApp.lightBlue0121,
                                          child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.all(8.w),
                                              itemCount: 6,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding: EdgeInsets.all(5.w),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.w),
                                                      color: ColorApp.lightBlue,
                                                    ),
                                                    child: SizedBox(
                                                      width: 300.w,
                                                      height: 100.h,
                                                    ),
                                                  ),
                                                );
                                              }));
                                    }
                                  })),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(49.w, 5.h, 49.w, 10.h),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(SelectTopicSingleGameScreen.route);
                          },
                          child: const Text(
                            "Chơi",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(26, 103, 246, 1),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 83.w, vertical: 7.w),
                              textStyle: TextStyle(
                                fontSize: 32.w,
                              ),
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                  borderRadius: BorderRadius.circular(24.w))))),
                ],
              ),
            ),
          ),
        ));
  }
}
