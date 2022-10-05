import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);
  static String route = "/info";
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        title: Container(
          width: 220.w,
          height: 30.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: const Color.fromRGBO(66, 192, 255, 1),
            borderRadius: BorderRadius.circular(24.w),
          ),
          child: Text(
            "Thông tin tài khoản",
            style: GoogleFonts.inter(
                color: const Color.fromRGBO(255, 255, 255, 1)),
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(),
      )),
    );
  }
}
