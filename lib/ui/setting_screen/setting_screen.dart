import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/dialog_change_password.dart';

import 'history.dart';
import 'info_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  final double icon_size = 70.w;
  final double text_size = 40.w;
  final double text_info_size = 40.sp;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0.h),
            child: Container(
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
                    style:
                        GoogleFonts.inter(color: ColorApp.white, fontSize: 40.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.h,bottom: 8.h ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: CircleAvatar(
                  radius: 100.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Huỳnh Nguyễn Vân Anh",
                      style: GoogleFonts.inter(fontSize: text_info_size),
                    ),
                    Text(
                      "ID: 002",
                      style: GoogleFonts.inter(fontSize: text_info_size),
                    ),
                    Text(
                      "Xếp hạng: 01",
                      style: GoogleFonts.inter(fontSize: text_info_size),
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
                  size: icon_size,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Thông tin cá nhân",
                  style: TextStyle(fontSize:text_size, color: ColorApp.black),
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
                  size: icon_size,
                  color: ColorApp.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Lịch sử trận đấu",
                  style: TextStyle(fontSize: text_size, color: ColorApp.black),
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
                  size: icon_size,
                  color: ColorApp.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Đổi mật khẩu",
                  style: TextStyle(fontSize: text_size, color: ColorApp.black),
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
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Icon(
                  Icons.logout,
                  size: icon_size,
                  color: ColorApp.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(fontSize: text_size, color: ColorApp.black),
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
