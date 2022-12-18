import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/user_controller.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/select_topic.dart';
import 'package:hab_app_trac_nghiem/ui/info_user/dialog_unfriend.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/history.dart';

class InfoUserScreen extends StatefulWidget {
  const InfoUserScreen({Key? key, required this.idUser}) : super(key: key);
  static String route = 'infouser';
  final int idUser;
  @override
  State<InfoUserScreen> createState() => InfoUserScreenState();
}

class InfoUserScreenState extends State<InfoUserScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.idUser);
    UserController.getUserbyId(widget.idUser);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (UserController.isLoad.value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorApp.white,
            leading: const BackButton(
              color: ColorApp.black,
            ),
            elevation: 0.0,
            title: Text(
              "${UserController.dataUser.displayName}",
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
                        Get.to(
                          () => HistoryScreen(
                            idUser: UserController.dataUser.id,
                          ),
                        );
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
                          NetworkImage('${UserController.dataUser.avatar}'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.w, 10.h, 0.w, 20.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Text(
                                "Xếp hạng Thử Thách: ${UserController.dataUser.rankingSingle}",
                                style: GoogleFonts.inter(
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Text(
                                "Xếp hạng Thách Đấu: ${UserController.dataUser.rankingChallenge}",
                                style: GoogleFonts.inter(
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.w600)),
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
                      "${UserController.dataUser.displayName}",
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
                                .pushNamed(
                                    SelectTopicChallengerGameScreen.route);
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
                      //TODO chưa nhận được thông tin
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
                          "Điểm cao nhất phần chơi Thử Thách: ${UserController.dataUser.scoreSingle}",
                          style: GoogleFonts.inter(fontSize: 30.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Mức điểm phần chơi Thách Đấu: ${UserController.dataUser.scoreChallenge}",
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
                          "Email: ${UserController.dataUser.email}",
                          style: GoogleFonts.inter(fontSize: 30.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Số điện thoại: ${UserController.dataUser.phone ?? 'Chưa có thông tin'}",
                          style: GoogleFonts.inter(fontSize: 30.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Ngày sinh: ${UserController.dataUser.dateOfBirth ?? 'Chưa có thông tin'}",
                          style: GoogleFonts.inter(fontSize: 30.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Địa chỉ: ${UserController.dataUser.address ?? 'Chưa có thông tin'}",
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
      } else {
        return Scaffold(
          body: Text('Dang tai du lieu nguoi dung...'),
        );
      }
    });
  }

  _buildUnfriendDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return const UnfriendDialog();
        });
  }
}
