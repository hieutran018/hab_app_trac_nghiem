import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/ranking_challenge_controller.dart';
import 'package:hab_app_trac_nghiem/models/ranking_challenge.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/new_screen/news_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final RankingChallengeController controller =
      Get.put(RankingChallengeController());

  Future<List<RankingChallenge>> _fetchRankingChallenge() async {
    dynamic rank = await RankingChallengeController.fetchDataRankingChallenge();
    print(rank[1]);
    return rank;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 16.h, 6.w, 0.h),
          child: Container(
            height: 70.h,
            color: ColorApp.blue,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(18.w, 13.h, 0.w, 13.h),
                      child: Text(
                        'Tin mới nhất',
                        style: GoogleFonts.inter(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorApp.white,
                        ),
                      )),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(0.w, 16.w, 8.w, 16.w),
                  //   child: InkWell(
                  //     onTap: () {},
                  //     child: const Text(
                  //       'Xem thêm >>',
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // )
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 0.h, 6.w, 0.h),
          child: Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                          height: 480.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                              padding: EdgeInsets.fromLTRB(0.w, 3.h, 3.w, 0.h),
                              child: InkWell(
                                onTap: () =>
                                    Navigator.of(context, rootNavigator: true)
                                        .pushNamed(NewsDetailScreen.route),
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        20.w,
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: ColorApp.lightGrey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.w, 5.w, 5.w, 0.w),
                                              child: Image.asset(
                                                "assets/images/thumbnail/thumbnail_news_1.png",
                                                height: 340.h,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.w, 5.w, 5.w, 0.w),
                                              child: Text(
                                                "Trạm Thiên Cung cân bằng nhiệt thế nào ở độ cao 400 km?",
                                                style: GoogleFonts.inder(
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5.w, 5.w, 5.w, 0.w),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5.w,
                                                              10.h,
                                                              5.w,
                                                              0.h),
                                                      child: RichText(
                                                        text: TextSpan(
                                                            children: [
                                                              WidgetSpan(
                                                                child: Icon(
                                                                    Icons
                                                                        .calendar_month_rounded,
                                                                    size:
                                                                        20.sp),
                                                              ),
                                                              TextSpan(
                                                                  text:
                                                                      "20/09/2022",
                                                                  style: GoogleFonts.inter(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          20.sp)),
                                                            ]),
                                                      ),
                                                    )
                                                  ],
                                                ))
                                          ],
                                        ))),
                              ),
                            ),
                          )),
                    ],
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 16.h, 6.w, 0.h),
          child: Container(
            height: 70.h,
            color: ColorApp.blue,
            child: Row(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(18.w, 13.h, 0.w, 13.h),
                  child: Text(
                    'Bảng xếp hạng người chơi',
                    style: GoogleFonts.inter(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorApp.white,
                    ),
                  )),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 5.h, 6.w, 0.h),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 760.h,
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
                        border: Border.all(width: 2.w, color: ColorApp.red),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3.w, 10.h, 3.w, 10.h),
                        child: Text(
                          "NGƯỜI CHƠI THÁCH ĐẤU",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 32.sp,
                              color: ColorApp.red,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 700.h,
                        child: FutureBuilder<List<RankingChallenge>>(
                          future: _fetchRankingChallenge(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(8.w),
                                  itemCount: 6,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.all(5.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.w),
                                          color: ColorApp.lightBlue,
                                        ),
                                        child: SizedBox(
                                            width: 300.w,
                                            height: 100.h,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w),
                                                  child: Image.asset(
                                                    "assets/images/components/ic_reward_no_1.png",
                                                    height: 50.h,
                                                    width: 50.w,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w),
                                                  child: Image.asset(
                                                      "assets/images/components/avatar.png"),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w),
                                                  child: SizedBox(
                                                    width: 450.w,
                                                    child: AutoSizeText(
                                                      "${snapshot.data[index].userId[0].firstName} ${snapshot.data[index].userId[0].lastName}",
                                                      maxLines: 1,
                                                      maxFontSize: 17,
                                                      minFontSize: 10,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.inter(
                                                        fontSize: 22.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            ColorApp.darkBlue,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 0.w),
                                                  child: AutoSizeText(
                                                    "${snapshot.data[index].scoreChallenge}",
                                                    maxLines: 1,
                                                    minFontSize: 10,
                                                    maxFontSize: 20,
                                                    style: GoogleFonts.inter(
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ColorApp.darkBlue,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    );
                                  });
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
