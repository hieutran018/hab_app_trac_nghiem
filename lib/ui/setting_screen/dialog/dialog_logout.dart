import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/auth_controller.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/login_screen.dart';
import 'package:lottie/lottie.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  final AuthController controller = Get.put(AuthController());
  final bool isScreen = true;
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
          color: ColorApp.green3191,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Thông báo",
            style: TextStyle(color: ColorApp.white, fontSize: 50.sp),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: Center(
                child: Lottie.asset('assets/images/components/logout.json',
                    fit: BoxFit.fill, height: 200.h),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 50),
              child: Center(
                child: Text(
                  "Bạn thật sự muốn đăng xuất tài khoản ?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 35.sp,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 200.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: ColorApp.lightBlue0121,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Quay lại",
                          style:
                              TextStyle(color: ColorApp.white, fontSize: 35.sp),
                        ),
                      ),
                    )),
                TextButton(
                    onPressed: () async {
                      bool auth = await controller.logOut();
                      // print(auth);
                      if (auth) {
                        Get.defaultDialog(
                            title: "Thông báo",
                            middleText: 'Bạn đã đăng xuất thành công!',
                            onConfirm: () {
                              Get.offAllNamed(LoginScreen.route);
                            });
                      } else {
                        Get.defaultDialog(
                            title: "Thông báo!",
                            middleText: 'Có lỗi xảy ra, vui lòng thử lại sau!');
                      }
                    },
                    child: Container(
                      width: 200.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: ColorApp.lightBlue0121,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Đăng xuất",
                          style:
                              TextStyle(color: ColorApp.white, fontSize: 35.sp),
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
