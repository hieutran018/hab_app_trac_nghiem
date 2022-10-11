// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hab_app_trac_nghiem/main.dart';
import 'package:splashscreen/splashscreen.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SplashScreen(
            seconds: 4,
            navigateAfterSeconds: const AfterSplash(),
            backgroundColor: const Color.fromRGBO(66, 149, 255, 1),
            loaderColor: const Color.fromARGB(255, 255, 255, 255),
            photoSize: 170.w,
            image: Image.asset("assets/images/logo_hab_large.png")));
  }
}
