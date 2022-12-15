import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/single_game_screen.dart';

class EndGameSingleDialog extends StatefulWidget {
  const EndGameSingleDialog({Key? key}) : super(key: key);

  @override
  State<EndGameSingleDialog> createState() => _EndGameSingleDialogState();
}

class _EndGameSingleDialogState extends State<EndGameSingleDialog> {
  GameController _gameController = Get.put(GameController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      title: Container(
        height: 80.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorApp.white,
          ),
          color: ColorApp.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Kết thúc",
            style: GoogleFonts.inter(color: ColorApp.white, fontSize: 50.sp),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: Text(
                "Điểm hiện tại: ${GameController.currentScoreSingle}",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 30.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: Text(
                "Tổng điểm: ${GameController.score}",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 30.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0.h),
              child: Text(
                "Điểm tổng kết: ${GameController.currentScoreSingle + GameController.score}",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 30.sp,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {
                      await GameController.createGameSingle(
                          GameController.idTopic,
                          GameController.idLevel,
                          GameController.score);
                      Get.offAllNamed(SingleGameScreen.route);
                    },
                    child: Container(
                      width: 300.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: ColorApp.lightBlue0121,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Thoát",
                          style: GoogleFonts.inter(
                              color: ColorApp.white, fontSize: 35.sp),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
