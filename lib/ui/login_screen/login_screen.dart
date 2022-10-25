// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/dialog_forgot_password.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.lightBlue5125,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(148.w, 40.w, 148.w, 0.w),
                      child: Image.asset(
                        "assets/images/logo_hab_small.png",
                        width: 132.w,
                        height: 166.h,
                      )),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text("Đăng nhập",
                      style: GoogleFonts.inriaSans(
                          fontSize: 70.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorApp.darkBlue418)),
                  Padding(
                    padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: ColorApp.black),
                        labelText: "Email",
                        hintText: "Nhập email...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0.w),
                        ),
                        filled: true,
                        fillColor: ColorApp.lightGrey,
                        isDense: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: ColorApp.black),
                        labelText: "Mật khẩu",
                        hintText: "Nhập mật khẩu...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0.w),
                        ),
                        filled: true,
                        fillColor: ColorApp.lightGrey,
                        isDense: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(49.w, 12.w, 49.w, 0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ForgotPasswordDialog();
                              },
                            );
                          },
                          child: Text(
                            "Quên mật khẩu?",
                            style: GoogleFonts.inter(
                                fontSize: 25.w,
                                fontWeight: FontWeight.w400,
                                color: ColorApp.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(151.w, 11.w, 151.w, 0.w),
                    child: Text(
                      "hoặc đăng nhập với",
                      style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorApp.white),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                            "assets/images/ic_login_with_google.png")),
                    SizedBox(
                      width: 75.w,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                            "assets/images/ic_login_with_facebook.png"))
                  ]),
                  SizedBox(
                    height: 35.w,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(color: ColorApp.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: ColorApp.lightBlue0121,
                          padding: EdgeInsets.symmetric(
                              horizontal: 83.w, vertical: 7.w),
                          textStyle: TextStyle(
                            fontSize: 32.w,
                          ),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: ColorApp.white),
                              borderRadius: BorderRadius.circular(24.w)))),
                  Container(
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.w),
                      color: ColorApp.white,
                    ),
                    child: TextButton(
                      child: Text(
                        "Đăng ký",
                        style: GoogleFonts.inter(color: ColorApp.darkBlue6761),
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(RegisterScreen.route);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
