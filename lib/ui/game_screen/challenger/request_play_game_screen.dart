import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/controllers/user_controller.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/select_topic.dart';
import 'package:hab_app_trac_nghiem/ui/info_user/info_user.dart';
import 'package:lottie/lottie.dart';

class RequestPlayGameScreen extends StatefulWidget {
  const RequestPlayGameScreen({Key? key}) : super(key: key);
  static String route = "/requestplaygame";

  @override
  State<RequestPlayGameScreen> createState() => RequestPlayGameScreenState();
}

class RequestPlayGameScreenState extends State<RequestPlayGameScreen> {
  @override
  void initState() {
    super.initState();
    UserController.fetchListUserGameChallenge();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(scaffoldBackgroundColor: ColorApp.blue),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.navigate_before_sharp,
                          size: 50.w,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 5.w),
                            child: Text(
                              "Phần chơi THÁCH ĐẤU",
                              style: GoogleFonts.inter(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 5.w, 0.w, 10.w),
                            child: Text(
                              "Chọn đối thủ nào <:",
                              style: GoogleFonts.inter(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.w, 20.w, 8.w, 0.w),
                  child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.w),
                            topRight: Radius.circular(12.w)),
                      ),
                      child: Obx(() {
                        if (UserController.isLoadlstUser.value) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height <= 1280.h
                                ? 770.h
                                : 870.h,
                            child: ListView.builder(
                                //physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(8.w),
                                itemCount: UserController.lstUser.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: EdgeInsets.all(5.w),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(
                                            () => InfoUserScreen(
                                              idUser: UserController
                                                  .lstUser[index].id,
                                            ),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.w),
                                            color: const Color.fromARGB(
                                                255, 0, 243, 182),
                                          ),
                                          child: SizedBox(
                                              width: 300.w,
                                              height: 100.h,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.w),
                                                      child: SizedBox(
                                                        child: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    "${UserController.lstUser[index].avatar}",
                                                                    scale:
                                                                        0.5)),
                                                      )),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w),
                                                    child: SizedBox(
                                                        width: 300.w,
                                                        child: AutoSizeText(
                                                          "${UserController.lstUser[index].displayName}",
                                                          maxLines: 1,
                                                          maxFontSize: 16,
                                                          minFontSize: 14,
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontSize: 25.sp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: ColorApp
                                                                .darkBlue,
                                                          ),
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 50.w),
                                                    child: Container(
                                                      height: 70.h,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.amber[900],
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      24.w))),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              GameController
                                                                      .idUserTo =
                                                                  UserController
                                                                      .lstUser[
                                                                          index]
                                                                      .id;
                                                            });
                                                            Navigator.of(
                                                              context,
                                                              rootNavigator:
                                                                  true,
                                                            ).pushNamed(
                                                              SelectTopicChallengerGameScreen
                                                                  .route,
                                                            );
                                                          },
                                                          child: Text(
                                                              "Thách đấu",
                                                              style: GoogleFonts.inter(
                                                                  fontSize:
                                                                      20.sp,
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      1),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ));
                                }),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(8.w, 20.w, 8.w, 0.w),
                            child: Column(
                              children: [
                                Lottie.asset(
                                    'assets/images/components/loading_data.json'),
                                Text(
                                  "Đang tìm kiếm người chơi ngẫu nhiên...",
                                  style: GoogleFonts.inter(
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.w700,
                                      color: ColorApp.blue6821),
                                )
                              ],
                            ),
                          );
                        }
                      })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
