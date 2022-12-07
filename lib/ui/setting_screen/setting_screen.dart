import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/auth_controller.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/login_screen.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/dialog/dialog_logout.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/dialog_change_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'history.dart';
import 'info_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  final AuthController controller = Get.put(AuthController());

  Future<bool> goto() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    if (token != null) {
      print(['NOT NULL', token]);
      return true;
    } else {
      print(['NULL', token]);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: goto(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // print('LOADING');
            return const Center(
              child: Text('Đang tải dữ liệu!'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            // print('HAVE DATA');
            if (snapshot.data == true) {
              return const _SettingScreen();
            } else {
              return const LoginScreen(
                isScreen: true,
              );
            }
          } else {
            return const Center(
              child: Text('Oop!'),
            );
          }
        });
  }
}

class _SettingScreen extends StatefulWidget {
  const _SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<_SettingScreen> {
  final AuthController controller = Get.put(AuthController());
  // ignore: non_constant_identifier_names
  final double icon_size = 70.w;
  // ignore: non_constant_identifier_names
  final double text_size = 40.w;
  // ignore: non_constant_identifier_names
  final double text_info_size = 40.sp;

  Future<User> getInfoUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    dynamic user = await AuthController.getDataUser(token.toString());
    print(user);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getInfoUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
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
                            style: GoogleFonts.inter(
                                color: ColorApp.white, fontSize: 40.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 8.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: CircleAvatar(
                          radius: 100.w,
                          backgroundImage:
                              NetworkImage('${snapshot.data.avatar}'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   "${snapshot.data.firstName} ${snapshot.data.lastName}",
                            //   style:
                            //       GoogleFonts.inter(fontSize: text_info_size),
                            // ),
                            Text(
                              "ID: ${snapshot.data.id}",
                              style:
                                  GoogleFonts.inter(fontSize: text_info_size),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Xếp hạng Thách Đấu:",
                                  style: GoogleFonts.inter(
                                      fontSize: text_info_size),
                                ),
                                snapshot.data.rankingChallenge == 1
                                    ? Image.asset(
                                        "assets/images/components/ic_reward_no_1.png",
                                        height: 50.h,
                                        width: 50.w,
                                      )
                                    : snapshot.data.rankingChallenge == 2
                                        ? Image.asset(
                                            "assets/images/components/ic_reward_no_2.png",
                                            height: 50.h,
                                            width: 50.w,
                                          )
                                        : snapshot.data.rankingChallenge == 3
                                            ? Image.asset(
                                                "assets/images/components/ic_reward_no_3.png",
                                                height: 50.h,
                                                width: 50.w,
                                              )
                                            : Text(
                                                "${snapshot.data.rankingChallenge}",
                                                style: GoogleFonts.inter(
                                                    fontSize: text_info_size))
                              ],
                            )
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
                          style: TextStyle(
                              fontSize: text_size, color: ColorApp.black),
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
                          style: TextStyle(
                              fontSize: text_size, color: ColorApp.black),
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
                          style: TextStyle(
                              fontSize: text_size, color: ColorApp.black),
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
                    _buildLogoutDialog();
                  },
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
                          style: TextStyle(
                              fontSize: text_size, color: ColorApp.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
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
                            style: GoogleFonts.inter(
                                color: ColorApp.white, fontSize: 40.sp),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 8.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Shimmer.fromColors(
                          baseColor: ColorApp.lightBlue,
                          highlightColor: ColorApp.lightBlue0121,
                          child: CircleAvatar(
                            radius: 100.w,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: ColorApp.lightBlue,
                              highlightColor: ColorApp.lightBlue0121,
                              child: Text(
                                "Đang tải dữ liệu...",
                                style:
                                    GoogleFonts.inter(fontSize: text_info_size),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: ColorApp.lightBlue,
                              highlightColor: ColorApp.lightBlue0121,
                              child: Text(
                                "Đang tải dữ liệu...",
                                style:
                                    GoogleFonts.inter(fontSize: text_info_size),
                              ),
                            ),
                            Row(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: ColorApp.lightBlue,
                                  highlightColor: ColorApp.lightBlue0121,
                                  child: Text(
                                    "Đang tải dữ liệu...",
                                    style: GoogleFonts.inter(
                                        fontSize: text_info_size),
                                  ),
                                ),
                              ],
                            )
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
                          style: TextStyle(
                              fontSize: text_size, color: ColorApp.black),
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
                          style: TextStyle(
                              fontSize: text_size, color: ColorApp.black),
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
                          style: TextStyle(
                              fontSize: text_size, color: ColorApp.black),
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
                          style: TextStyle(
                              fontSize: text_size, color: ColorApp.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
          } else {
            return const Text('Co Loi Xay ra!');
          }
        });
  }

  _buildLogoutDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const LogoutDialog();
        });
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
