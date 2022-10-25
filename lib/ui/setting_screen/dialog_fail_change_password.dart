import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';

class FailDialog extends StatefulWidget {
  const FailDialog({Key? key}) : super(key: key);

  @override
  State<FailDialog> createState() => _FailDialogState();
}

class _FailDialogState extends State<FailDialog> {
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
          color: ColorApp.red,
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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 50),
            child: Center(
              child: Text(
                "Thay đổi mật khẩu thất bại!",
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
        ]),
      ),
    );
  }
}
