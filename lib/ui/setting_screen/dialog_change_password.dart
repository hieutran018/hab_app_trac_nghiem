import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';

import 'package:hab_app_trac_nghiem/ui/setting_screen/dialog_success_change_password.dart';

import '../login_screen/dialog_forgot_password.dart';
import 'dialog_fail_change_password.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({Key? key}) : super(key: key);

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        height: 50.h,
        width: 30.w,
        child: Center(
          child: Text(
            "Đổi mật khẩu",
            style: TextStyle(
              color: ColorApp.blue,
              fontSize: 35.sp,
            ),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  ),
                  hintText: 'Nhập mật khẩu hiện tại',
                  labelText: 'Nhập mật khẩu hiện tại',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                    ),
                    hintText: 'Nhập mật khẩu mới',
                    labelText: 'Nhập mật khẩu mới',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                    ),
                    hintText: 'Xác nhận mật khẩu',
                    labelText: 'Xác nhận mật khẩu',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  _buildForgotPasswordDialog();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Quên mật khẩu?",
                      style: GoogleFonts.inter(
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    _buildFailDialog();
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
                        "Đổi mật khẩu",
                        style:
                            TextStyle(color: ColorApp.white, fontSize: 35.sp),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _buildForgotPasswordDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return ForgotPasswordDialog();
        });
  }

  _buildSuccessDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog();
        });
  }

  _buildFailDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return FailDialog();
        });
  }
}
