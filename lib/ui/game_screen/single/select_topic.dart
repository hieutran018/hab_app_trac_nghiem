import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/playing_game_screen.dart';

class SelectTopicSingleGameScreen extends StatefulWidget {
  const SelectTopicSingleGameScreen({Key? key}) : super(key: key);
  static String route = "/selecttopicsinglegame";

  @override
  State<SelectTopicSingleGameScreen> createState() =>
      SelectTopicSingleGameScreenState();
}

class SelectTopicSingleGameScreenState
    extends State<SelectTopicSingleGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: ColorApp.blue),
      child: Scaffold(
        body: SafeArea(
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
                            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 5.h),
                            child: Text(
                              "Phần chơi THỬ THÁCH",
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
                            padding: EdgeInsets.fromLTRB(10.w, 5.w, 0.w, 10.w),
                            child: Text(
                              "Chọn chủ đề bạn muốn <:",
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
                    child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(4.w, 20.w, 4.w, 0.w),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsets.all(5.w),
                              child: Container(
                                height: 230.h,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: ColorApp.darkGrey),
                                    borderRadius: BorderRadius.circular(20.w),
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1)),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ListTile(
                                          leading: Image.asset(
                                            'assets/images/components/physic.png',
                                            width: 120.w,
                                            height: 120.h,
                                            fit: BoxFit.cover,
                                          ),
                                          title: Text("Khoa Học",
                                              style: GoogleFonts.inter(
                                                  fontSize: 32.sp,
                                                  fontWeight: FontWeight.w600)),
                                          subtitle: Text(
                                            "Các câu hỏi liên quan đến lĩnh vực khoa học!",
                                            style: GoogleFonts.inter(
                                                fontSize: 20.sp),
                                          )),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 8.h, right: 8.w),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    color:
                                                        ColorApp.lightBlue0121,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12))),
                                                child: TextButton(
                                                    onPressed: () {
                                                      Navigator.of(
                                                        context,
                                                        rootNavigator: true,
                                                      ).pushNamed(
                                                        PlayingSingleGameScreen
                                                            .route,
                                                      );
                                                    },
                                                    child: Text("Bắt đầu",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 20.sp,
                                                                color: ColorApp
                                                                    .white))),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                              ));
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
