import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';

import 'dialog_fail_verification.dart';
import 'dialog_success_verification.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
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
          color: ColorApp.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Quên mật khẩu",
            style: GoogleFonts.inter(color: ColorApp.white, fontSize: 50.sp),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: Text(
                "Vui lòng cung cấp địa chỉ email bạn sử dụng đăng ký tài khoản, chúng tôi sẽ gửi mã xác nhận đến tài khoản email của bạn",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 30.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.0.h),
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  labelText: "Email",
                  hintText: "Nhập email của bạn...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0.w),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(255, 255, 255, 0.49.w),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  _buildSuccessVerificationDialog();
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
                      style: GoogleFonts.inter(
                          color: ColorApp.white, fontSize: 35.sp),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _buildSuccessVerificationDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SuccessVerificationDialog();
        });
  }

  _buildFailVerificationDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return FailVerificationDialog();
        });
  }
}
