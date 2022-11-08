// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hab_app_trac_nghiem/main.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
// import 'package:hab_app_trac_nghiem/ui/main_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = 720.0;
    var height = 1280.0;
    return SafeArea(
      child: ScreenUtilInit(
          designSize: Size(width, height),
          builder: (context, child) => SplashScreen(
              seconds: 4,
              navigateAfterSeconds: const AfterSplash(),
              backgroundColor: ColorApp.lightBlue5125,
              loaderColor: const Color.fromARGB(255, 255, 255, 255),
              photoSize: 170.w,
              image: Image.asset("assets/images/logo_hab_large.png"))),
    );
  }
}
