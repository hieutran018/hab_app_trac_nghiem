import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/roles_game_single.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/select_topic.dart';

class SingleGameScreen extends StatefulWidget {
  const SingleGameScreen({Key? key}) : super(key: key);
  static String route = "/signlegame";

  @override
  State<SingleGameScreen> createState() => SingleGameScreenState();
}

class SingleGameScreenState extends State<SingleGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.blue,
          leading: const BackButton(color: Color.fromRGBO(255, 255, 255, 1)),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          color: ColorApp.white,
                          border: Border.all(width: 2.w, color: ColorApp.blue),
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
                          border:
                              Border.all(width: 2.w, color: ColorApp.darkGreen),
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
                                border:
                                    Border.all(width: 2.w, color: ColorApp.red),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(3.w, 10.h, 3.w, 10.h),
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
                              height:
                                  MediaQuery.of(context).size.height <= 1280.h
                                      ? 770.h
                                      : 870.h,
                              child: ListView.builder(
                                  //physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(8.w),
                                  itemCount: 10,
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
                                                  child: Text(
                                                    "Trần Dương Chí Hiếu",
                                                    style: GoogleFonts.inter(
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ColorApp.darkBlue,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 130.w),
                                                  child: Text(
                                                    "100",
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
                                  }),
                            ),
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
        ));
  }
}
