import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/controllers/notification_controller.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/challenger_game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/playing_game_screen_challenger_mode.dart';
import 'package:lottie/lottie.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static String route = '/notification';

  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    NotificationController.fetchDataNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.lightBlue5125,
          leading: const BackButton(color: Color.fromRGBO(255, 255, 255, 1)),
          title: Image.asset(
            "assets/images/components/ic_logo_hab.png",
            width: 45.w,
            height: 55.w,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.w),
              child: Container(
                width: 200.w,
                height: 60.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorApp.white),
                  color: ColorApp.blue,
                  borderRadius: BorderRadius.circular(24.w),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.w, 3.w, 0.w, 3.w),
                  child: Center(
                    child: Text(
                      "Thông báo",
                      style: GoogleFonts.inter(
                          color: ColorApp.white, fontSize: 30.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
            Obx(() {
              if (NotificationController.isLoading.value) {
                return Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      itemCount: NotificationController.listNoti.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              if (NotificationController
                                      .listNoti[index].status !=
                                  0) {
                                setState(() {
                                  GameController.idTopic =
                                      NotificationController
                                          .listNoti[index].topicId[0].id;
                                  GameController.idLevel =
                                      NotificationController
                                          .listNoti[index].levelId[0].id;

                                  GameController.matchId =
                                      NotificationController
                                          .listNoti[index].matchId;
                                });
                                Get.to(
                                  () => PlayingChallengerGameScreen(
                                    screen: true,
                                  ),
                                );
                              } else {
                                Get.defaultDialog(
                                    title: "Thông báo",
                                    textConfirm: 'Xác nhận',
                                    middleText:
                                        'Bạn đã giải quyết phần chơi này rồi!',
                                    onConfirm: () {
                                      Navigator.pop(context);
                                    });
                              }
                            },
                            child: Container(
                              height: 150.h,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  border: Border.all(
                                      width: 0.1.w, color: ColorApp.darkGrey)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.w),
                                    child: CircleAvatar(
                                      child: SvgPicture.asset(
                                          "assets/images/components/noti_friend.svg"),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 15.w),
                                        child: Container(
                                          color: ColorApp.white,
                                          height: 90.h,
                                          child: SizedBox(
                                            child: RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "${NotificationController.listNoti[index].userIdRequest[0].displayName}",
                                                    style: TextStyle(
                                                        color: ColorApp.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 40.sp)),
                                                TextSpan(
                                                    text:
                                                        " ${NotificationController.listNoti[index].notificationId == 1 ? 'đã gửi cho bạn một lời THÁCH ĐẤU' : 'đã gửi cho bạn một lời mời kết bạn'}",
                                                    style: TextStyle(
                                                        color: ColorApp.black,
                                                        fontSize: 40.sp)),
                                              ]),
                                            ),
                                          ),
                                        )),
                                  )
                                ],
                              ),
                            ));
                      }),
                );
              } else {
                return LottieBuilder.asset(
                    'assets/images/components/loading_data.json');
              }
            })
          ],
        ));
  }
}
