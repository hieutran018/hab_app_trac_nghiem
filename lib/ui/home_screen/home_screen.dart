import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/new_screen/news_detail_screen.dart';
import 'package:stroke_text/stroke_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 16.h, 6.w, 0.h),
          child: Container(
            height: 50.h,
            color: const Color.fromRGBO(0, 240, 255, 1),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(18.w, 13.h, 0.w, 13.h),
                      child: StrokeText(
                        text: 'Tin mới nhất',
                        textStyle: TextStyle(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                        strokeColor: const Color.fromARGB(255, 255, 255, 255),
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
                          height: 450.h,
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
                                        width: 400.w,
                                        color: const Color.fromRGBO(
                                            217, 217, 217, 1),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.w, 5.w, 5.w, 0.w),
                                              child: Image.asset(
                                                "assets/images/thumbnail/thumbnail_news_1.png",
                                                height: 300.h,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.w, 5.w, 5.w, 0.w),
                                              child: Text(
                                                "Trạm Thiên Cung cân bằng nhiệt thế nào ở độ cao...",
                                                style: TextStyle(
                                                  fontSize: 17.w,
                                                ),
                                                textAlign: TextAlign.left,
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
                                                              40.h,
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
            height: 50.h,
            color: const Color.fromRGBO(0, 240, 255, 1),
            child: Row(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(18.w, 13.h, 0.w, 13.h),
                  child: StrokeText(
                    text: 'Bảng xếp hạng người chơi',
                    textStyle: GoogleFonts.inter(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    strokeColor: const Color.fromARGB(255, 255, 255, 255),
                  )),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 0.h, 6.w, 0.h),
          child: Column(
            children: [
              Container(
                width: 416.w,
                height: 600.h,
                color: const Color.fromARGB(255, 236, 234, 234),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.w),
                        color: Colors.white,
                        border: Border.all(
                            width: 2.w,
                            color: const Color.fromRGBO(255, 0, 0, 1)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                        child: Text(
                          "NGƯỜI CHƠI THÁCH ĐẤU",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              color: const Color.fromRGBO(255, 0, 0, 1),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 550.w,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(8.w),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.w),
                                  color: const Color.fromARGB(255, 0, 243, 182),
                                ),
                                child: SizedBox(
                                    width: 200.w,
                                    height: 90.h,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              5.w, 0.h, 5.w, 0.h),
                                          child: Image.asset(
                                              "assets/images/components/ic_reward_no_1.png"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              5.w, 0.h, 5.w, 0.h),
                                          child: Image.asset(
                                              "assets/images/components/avatar.png"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              5.w, 0.h, 15.w, 0.h),
                                          child: Text(
                                            "Trần Dương Chí Hiếu",
                                            style: GoogleFonts.inter(
                                              fontSize: 18.w,
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  255, 122, 0, 1),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "100",
                                          style: GoogleFonts.inter(
                                            fontSize: 18.w,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromRGBO(
                                                255, 122, 0, 1),
                                          ),
                                          textAlign: TextAlign.right,
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
      ],
    ));
  }
}
