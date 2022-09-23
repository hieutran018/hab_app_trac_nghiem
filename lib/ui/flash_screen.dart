import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            color: const Color.fromRGBO(66, 194, 255, 1),
            child: Image.asset(
              "assets/images/logo_hab_large.png",
              width: 327.w,
              height: 366.w,
            )));
  }
}
