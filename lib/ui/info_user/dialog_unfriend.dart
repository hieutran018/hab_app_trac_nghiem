import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';

class UnfriendDialog extends StatefulWidget {
  const UnfriendDialog({Key? key}) : super(key: key);

  @override
  State<UnfriendDialog> createState() => UnfriendDialogState();
}

class UnfriendDialogState extends State<UnfriendDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
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
            "Thông báo",
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
              padding: const EdgeInsets.only(top: 50.0, bottom: 50),
              child: Center(
                child: Text(
                  "Bạn thật sư muốn hủy kết bạn với Dương Nghĩa Hiệp!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 35.sp,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 200.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: ColorApp.lightBlue0121,
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Center(
                        child: Text(
                          "Xác nhận",
                          style:
                              TextStyle(color: ColorApp.white, fontSize: 35.sp),
                        ),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 200.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                          color: ColorApp.white,
                          borderRadius: BorderRadius.circular(20.w),
                          border: Border.all(color: ColorApp.lightBlue0121)),
                      child: Center(
                        child: Text(
                          "Hủy",
                          style: TextStyle(
                              color: ColorApp.lightBlue0121, fontSize: 35.sp),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
