import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';

class HistoryDetailSingleGame extends StatelessWidget {
  const HistoryDetailSingleGame({Key? key}) : super(key: key);
  static String route = 'historydetailsingle';

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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0.h, 0.h, 20.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 70.w,
                  backgroundImage:
                      const AssetImage('assets/images/components/avatar_1.png'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.w, 10.h, 0.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text("Thử Thách",
                            style: GoogleFonts.inter(
                                fontSize: 25.sp, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text("Chủ đề: Khoa học",
                            style: GoogleFonts.inter(
                                fontSize: 25.sp, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text("Độ khó: Trung bình",
                            style: GoogleFonts.inter(
                                fontSize: 25.sp, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text("Thời gian chơi: 00:05:01",
                            style: GoogleFonts.inter(
                                fontSize: 25.sp, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text("Ngày: 26/10/2022",
                            style: GoogleFonts.inter(
                                fontSize: 25.sp, fontWeight: FontWeight.w600)),
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
                Text("Số câu đúng: 14/15",
                    style: GoogleFonts.inter(
                        fontSize: 25.sp, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 10.h),
            child: const Divider(
              color: ColorApp.darkGrey,
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(8.w),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(HistoryDetailSingleGame.route);
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
                                Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Text(
                                      '${index + 1}',
                                      style: GoogleFonts.inter(
                                          color: ColorApp.lightBlue5125,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 40.sp),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 100.w),
                                    child: Container(
                                      width: 70.w,
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                          color: ColorApp.white,
                                          borderRadius:
                                              BorderRadius.circular(50.w)),
                                      child: Center(
                                          child: Text(
                                        "A",
                                        style: GoogleFonts.inter(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w700),
                                      )),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Container(
                                      width: 70.w,
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                          color: ColorApp.white,
                                          borderRadius:
                                              BorderRadius.circular(50.w)),
                                      child: Center(
                                          child: Text(
                                        "B",
                                        style: GoogleFonts.inter(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w700),
                                      )),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Container(
                                      width: 70.w,
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                          color: ColorApp.white,
                                          borderRadius:
                                              BorderRadius.circular(50.w)),
                                      child: Center(
                                          child: Text(
                                        "C",
                                        style: GoogleFonts.inter(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w700),
                                      )),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Container(
                                      width: 70.w,
                                      height: 70.h,
                                      decoration: BoxDecoration(
                                          color: ColorApp.white,
                                          borderRadius:
                                              BorderRadius.circular(50.w)),
                                      child: Center(
                                          child: Text(
                                        "D",
                                        style: GoogleFonts.inter(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w700),
                                      )),
                                    )),
                              ],
                            )),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
