import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/single_game_screen.dart';

class ExitGameDialog extends StatefulWidget {
  const ExitGameDialog({Key? key}) : super(key: key);

  @override
  State<ExitGameDialog> createState() => ExitGameDialogState();
}

class ExitGameDialogState extends State<ExitGameDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.w),
      ),
      title: Container(
        height: 80.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorApp.white,
          ),
          color: ColorApp.green3191,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Tạm ngưng",
            style: TextStyle(color: ColorApp.white, fontSize: 50.sp),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0.h, bottom: 50.h),
              child: Center(
                child: Text(
                  "Bạn thật sự muốn ngưng phần chơi?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 35.sp,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 180.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.w),
                    color: ColorApp.lightRed2251,
                  ),
                  child: TextButton(
                    child: Text(
                      "Xác nhận",
                      style: GoogleFonts.inter(color: ColorApp.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 180.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.w),
                    color: ColorApp.lightBlue4121,
                  ),
                  child: TextButton(
                    child: Text(
                      "Hủy",
                      style: GoogleFonts.inter(color: ColorApp.white),
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
