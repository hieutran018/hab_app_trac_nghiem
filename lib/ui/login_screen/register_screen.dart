import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/controllers/auth_controller.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/components/validate.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String route = '/register';
  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_function_declarations_over_variables

    return Scaffold(
      backgroundColor: ColorApp.lightBlue5125,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(148.w, 10.w, 148.w, 0.w),
                        child: Image.asset(
                          "assets/images/logo_hab_small.png",
                          width: 132.w,
                          height: 166.h,
                        )),
                    SizedBox(
                      height: 35.h,
                    ),
                    Text("Đăng ký tài khoản",
                        style: GoogleFonts.inriaSans(
                            fontSize: 70.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorApp.darkBlue418)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
                      child: TextFormField(
                        controller: _firstNameController,
                        validator: (val) {
                          if (val!.trim().isEmpty) {
                            return 'Họ không được bỏ trống!';
                          } else if (!val.isValidName) {
                            return 'Họ không hợp lệ!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: GoogleFonts.inter(color: ColorApp.white),
                          labelStyle: const TextStyle(color: ColorApp.black),
                          labelText: "Họ",
                          hintText: "Nhập họ...",
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
                        controller: _lastNameController,
                        validator: (val) {
                          if (val!.trim().isEmpty) {
                            return 'Tên không được bỏ trống!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: GoogleFonts.inter(color: ColorApp.white),
                          labelStyle: const TextStyle(color: ColorApp.black),
                          labelText: "Tên",
                          hintText: "Nhập tên...",
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
                        controller: _emailController,
                        validator: (val) {
                          if (val!.trim().isEmpty) {
                            return 'Email không được bỏ trống!';
                          } else if (!val.isValidEmail) {
                            return 'Email không hợp lệ!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: GoogleFonts.inter(color: ColorApp.white),
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
                        controller: _passwordController,
                        validator: (val) {
                          if (val!.trim().isEmpty) {
                            return 'Mật khẩu không được bỏ trống!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: GoogleFonts.inter(color: ColorApp.white),
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
                      padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        validator: (val) {
                          if (val!.trim().isEmpty) {
                            return 'Xác nhận mật khẩu không được bỏ trống!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: GoogleFonts.inter(color: ColorApp.white),
                          labelStyle: const TextStyle(color: ColorApp.black),
                          labelText: "Xác nhận mật khẩu",
                          hintText: "Nhập xác nhận mật khẩu...",
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
                      padding: EdgeInsets.fromLTRB(182.w, 25.h, 48.w, 0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text("Đã có tài khoản? Đi đến đăng nhập",
                                style: GoogleFonts.inter(
                                    fontSize: 25.sp, color: ColorApp.white)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.w),
                    ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            String message = await controller.register(
                                _firstNameController.text,
                                _lastNameController.text,
                                _emailController.text,
                                _passwordController.text);
                            if (message != "") {
                              Get.defaultDialog(
                                  title: "Oop!", middleText: message);
                            } else {
                              Get.offAllNamed(LoginScreen.route);
                            }
                          }
                        },
                        child: const Text(
                          "Đăng ký",
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
                  ],
                ))),
      ),
    );
  }
}
