import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';

class SuccessVerificationDialog extends StatefulWidget {
  const SuccessVerificationDialog({Key? key}) : super(key: key);

  @override
  State<SuccessVerificationDialog> createState() =>
      _SuccessVerificationDialog();
}

class _SuccessVerificationDialog extends State<SuccessVerificationDialog> {
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
              padding: EdgeInsets.only(top: 50.0.h, bottom: 50.h),
              child: Center(
                child: Text(
                  "Mã xác nhận đã được gửi đến địa chỉ email của bạn",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 35.sp,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 300.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: ColorApp.lightBlue0121,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(color: ColorApp.white, fontSize: 35.sp),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
