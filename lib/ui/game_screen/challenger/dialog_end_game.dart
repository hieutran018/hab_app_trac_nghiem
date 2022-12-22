import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/game_controller.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/main_screen.dart';

class EndGameChallengeDialog extends StatefulWidget {
  const EndGameChallengeDialog({Key? key, required this.screen})
      : super(key: key);
  final bool screen;
  @override
  State<EndGameChallengeDialog> createState() => _EndGameChallengeDialogState();
}

class _EndGameChallengeDialogState extends State<EndGameChallengeDialog> {
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
                "Tổng điểm của bạn: ${GameController.score}",
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
                      print(!widget.screen);
                      if (!widget.screen) {
                        await GameController.createDataGameChallenge(
                            GameController.idTopic,
                            GameController.idLevel,
                            GameController.score);
                      } else {
                        await GameController.createDataAcceptGameChallenge(
                            GameController.idTopic,
                            GameController.idLevel,
                            GameController.score);
                      }
                      Get.offAllNamed(MainScreen.route);
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
