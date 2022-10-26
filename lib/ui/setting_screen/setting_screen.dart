import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/dialog_change_password.dart';

import 'history.dart';
import 'info_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Center(
          child: Container(
            // padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.only(top: 10.w, bottom: 10.w),
            width: 150.w,
            height: 30.w,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30.w)),
            ),
            child: Center(
              child: Text(
                "Cài đặt chung",
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 20.w,
                ),
              ),
            ),
          ),
        ),
        Row(
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
                    style: TextStyle(fontSize: 20.w),
                  ),
                  Text(
                    "ID: 002",
                    style: TextStyle(fontSize: 20.w),
                  ),
                  Text(
                    "Xếp hạng: 01",
                    style: TextStyle(fontSize: 20.w),
                  ),
                ],
              ),
            ),
          ],
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
                child: const Icon(
                  Icons.person,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  size: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: Text(
                  "Thông tin cá nhân",
                  style: TextStyle(
                      fontSize: 20.w,
                      color: const Color.fromRGBO(0, 0, 0, 0.867)),
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
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Lịch sử trận đấu",
                  style: TextStyle(
                      fontSize: 20.w,
                      color: const Color.fromRGBO(0, 0, 0, 0.867)),
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
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Đổi mật khẩu",
                  style: TextStyle(
                      fontSize: 20.w,
                      color: const Color.fromRGBO(0, 0, 0, 0.867)),
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
                  size: 50.w,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(
                      fontSize: 20.w,
                      color: const Color.fromRGBO(0, 0, 0, 0.867)),
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
