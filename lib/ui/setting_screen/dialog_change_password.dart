import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hab_app_trac_nghiem/ui/setting_screen/success_dialog.dart';

import 'fail_dialog.dart';

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
        height: 50,
        width: 30,
        child: Center(
          child: Text(
            "Đổi mật khẩu",
            style: TextStyle(
              color: const Color.fromRGBO(33, 150, 243, 1),
              fontSize: 35.w,
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
                onPressed: () {},
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
                  Navigator.pop(context);
                  _buildFailDialog();
                },
                child: Container(
                  height: 60.w,
                  width: 250.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Đổi mật khẩu",
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 30.w),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
