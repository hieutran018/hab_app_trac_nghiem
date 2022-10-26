import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/select_topic.dart';
import 'package:hab_app_trac_nghiem/ui/info_user/dialog_unfriend.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history.dart';

class InfoUserScreen extends StatefulWidget {
  const InfoUserScreen({Key? key}) : super(key: key);
  static String route = 'infouser';

  @override
  State<InfoUserScreen> createState() => InfoUserScreenState();
}

class InfoUserScreenState extends State<InfoUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        leading: const BackButton(
          color: ColorApp.black,
        ),
        elevation: 0.0,
        title: Text(
          "Dương Nghĩa Hiệp",
          style: GoogleFonts.inter(
              fontSize: 35.sp,
              color: ColorApp.black,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Container(
              color: ColorApp.lightBlue0121,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(HistoryScreen.route);
                  },
                  child: Text(
                    "Lịch sử",
                    style: GoogleFonts.inter(color: ColorApp.white),
                  )))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 10.h, 0.w, 20.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 100.w,
                  backgroundImage:
                      const AssetImage('assets/images/components/avatar_1.png'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.w, 10.h, 0.w, 20.h),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text("Xếp hạng Thử Thách: 1",
                            style: GoogleFonts.inter(
                                fontSize: 35.sp, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text("Xếp hạng Thách Đấu: 1",
                            style: GoogleFonts.inter(
                                fontSize: 35.sp, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 10.h, 0.w, 20.h),
            child: Row(
              children: [
                Text(
                  "Dương Nghĩa Hiệp",
                  style: GoogleFonts.inter(
                      fontSize: 40.sp, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: ColorApp.blue,
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(SelectTopicChallengerGameScreen.route);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.whatshot,
                            color: ColorApp.white,
                          ),
                          Text(
                            "Thách đấu",
                            style: GoogleFonts.inter(color: ColorApp.white),
                          ),
                        ],
                      )),
                ),
                Container(
                  width: 250.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorApp.blue),
                    borderRadius: BorderRadius.circular(12.w),
                    color: ColorApp.white,
                  ),
                  child: TextButton(
                      onPressed: () {
                        _buildUnfriendDialog();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hủy kết bạn",
                            style: GoogleFonts.inter(color: ColorApp.blue),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 0.h, 30.w, 10.h),
            child: const Divider(
              color: ColorApp.darkGrey,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: ColorApp.darkGrey11103,
                  ),
                  width: 300.w,
                  height: 50.h,
                  child: Center(
                    child: Text("Sơ lược thành tích",
                        style: GoogleFonts.inter(
                            fontSize: 30.sp, color: ColorApp.black)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Tổng số lần chơi: 10",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Điểm cao nhất phần chơi Thử Thách: 1000",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Mức điểm phần chơi Thách Đấu: 1000",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 0.h, 30.w, 10.h),
            child: const Divider(
              color: ColorApp.darkGrey,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: ColorApp.darkGrey11103,
                  ),
                  width: 300.w,
                  height: 50.h,
                  child: Center(
                    child: Text("Thông tin cá nhân",
                        style: GoogleFonts.inter(
                            fontSize: 30.sp, color: ColorApp.black)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30.w, 10.h, 30.w, 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Email: duongnghiahiep@gmail.com",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Số điện thoại: Chưa cập nhật",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Ngày sinh: Chưa cập nhật",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Địa chỉ: Thành phố Hồ Chí Minh",
                      style: GoogleFonts.inter(fontSize: 30.sp),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildUnfriendDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const UnfriendDialog();
        });
  }
}
