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
                        "L???ch s???",
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
                                "X???p h???ng Th??? Th??ch: ${UserController.dataUser.rankingSingle}",
                                style: GoogleFonts.inter(
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Text(
                                "X???p h???ng Th??ch ?????u: ${UserController.dataUser.rankingChallenge}",
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
                                "Th??ch ?????u",
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
                                "H???y k???t b???n",
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
                        child: Text("S?? l?????c th??nh t??ch",
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
                      //TODO ch??a nh???n ???????c th??ng tin
                      children: [
                        Text(
                          "T???ng s??? l???n ch??i: 10",
                          style: GoogleFonts.inter(fontSize: 30.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "??i???m cao nh???t ph???n ch??i Th??? Th??ch: ${UserController.dataUser.scoreSingle}",
                          style: GoogleFonts.inter(fontSize: 30.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "M???c ??i???m ph???n ch??i Th??ch ?????u: ${UserController.dataUser.scoreChallenge}",
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
                        child: Text("Th??ng tin c?? nh??n",
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
                          "S??? ??i???n tho???i: ${UserController.dataUser.phone ?? 'Ch??a c?? th??ng tin'}",
                          style: GoogleFonts.inter(fontSize: 30.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Ng??y sinh: ${UserController.dataUser.dateOfBirth ?? 'Ch??a c?? th??ng tin'}",
                          style: GoogleFonts.inter(fontSize: 30.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "?????a ch???: ${UserController.dataUser.address ?? 'Ch??a c?? th??ng tin'}",
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
