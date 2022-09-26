import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
import 'package:hab_app_trac_nghiem/ui/main_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/login_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/login_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/register_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainScreen(),
          );
        });
  }
}
