import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/login_screen.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/dialog_change_password.dart';

import 'history.dart';
import 'info_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
<<<<<<< Updated upstream
=======
  // ignore: non_constant_identifier_names
  final double icon_size = 70.w;
  // ignore: non_constant_identifier_names
  final double text_size = 40.w;
  // ignore: non_constant_identifier_names
  final double text_info_size = 40.sp;
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Center(
          child: Container(
            width: 240.w,
            height: 60.h,
            decoration: BoxDecoration(
              border: Border.all(color: ColorApp.white),
              color: ColorApp.blue,
              borderRadius: BorderRadius.circular(24.w),
            ),
            child: Container(
<<<<<<< Updated upstream
              padding: EdgeInsets.fromLTRB(0.w, 3.w, 0.w, 3.w),
              child: Center(
                child: Text(
                  "Cài đặt chung",
                  style:
                      GoogleFonts.inter(color: ColorApp.white, fontSize: 30.sp),
                  textAlign: TextAlign.center,
=======
              width: 300.w,
              height: 80.h,
              decoration: BoxDecoration(
                border: Border.all(color: ColorApp.white),
                color: ColorApp.blue,
                borderRadius: BorderRadius.circular(50.w),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(0.w, 3.w, 0.w, 3.w),
                child: Center(
                  child: Text(
                    "Cài đặt chung",
                    style: GoogleFonts.inter(
                        color: ColorApp.white, fontSize: 40.sp),
                    textAlign: TextAlign.center,
                  ),
>>>>>>> Stashed changes
                ),
              ),
            ),
          ),
        ),
        Padding(
<<<<<<< Updated upstream
          padding: EdgeInsets.only(top: 15.h),
=======
          padding: EdgeInsets.only(top: 15.h, bottom: 8.h),
>>>>>>> Stashed changes
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: CircleAvatar(
                  radius: 50.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Huỳnh Nguyễn Vân Anh",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                    Text(
                      "ID: 002",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                    Text(
                      "Xếp hạng: 01",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2.w,
          indent: 20.w,
          endIndent: 20.w,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(InfoScreen.route);
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Icon(
                  Icons.person,
                  color: ColorApp.black,
                  size: 50.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Thông tin cá nhân",
<<<<<<< Updated upstream
                  style: TextStyle(fontSize: 25.w, color: ColorApp.black),
=======
                  style: TextStyle(fontSize: text_size, color: ColorApp.black),
>>>>>>> Stashed changes
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2.w,
          indent: 20.w,
          endIndent: 20.w,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(HistoryScreen.route);
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Icon(
                  Icons.history,
                  size: 50.w,
                  color: ColorApp.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Lịch sử trận đấu",
                  style: TextStyle(fontSize: 25.w, color: ColorApp.black),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2.w,
          indent: 20.w,
          endIndent: 20.w,
        ),
        TextButton(
          onPressed: () {
            _buildDialog();
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Icon(
                  Icons.lock_rounded,
                  size: 50.w,
                  color: ColorApp.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Đổi mật khẩu",
                  style: TextStyle(fontSize: 25.w, color: ColorApp.black),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2.w,
          indent: 20.w,
          endIndent: 20.w,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pushNamed(LoginScreen.route);
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Icon(
                  Icons.logout,
                  size: 50.w,
                  color: ColorApp.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(fontSize: 25.w, color: ColorApp.black),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  _buildDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangePasswordDialog();
      },
    );
  }
}
