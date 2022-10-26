import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/provider/authprovider.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String route = '/register';
  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    // ignore: prefer_function_declarations_over_variables
    void doRegister() {
      final form = formKey.currentState;

      form?.save();

      auth.loggedInStatus = Status.authenticating;
      auth.notify();
      auth
          .register(_emailController.text, _passwordController.text,
              _firstNameController.text, _lastNameController.text)
          .then((response) {
        if (response == true) {
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          print("FAILED");
        }
      });

      // Future.delayed(loginTime).then((_) {
      //   auth.loggedInStatus = Status.loggedIn;
      //   auth.notify();
      // });
    }

    return Scaffold(
      backgroundColor: ColorApp.lightBlue5125,
      body: SafeArea(
        child: SingleChildScrollView(
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
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: ColorApp.black),
                  labelText: "Họ",
                  hintText: "Nhập họ...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0.w),
                  ),
                  filled: true,
                  fillColor: ColorApp.lightGrey,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
              child: TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: ColorApp.black),
                  labelText: "Tên",
                  hintText: "Nhập tên...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0.w),
                  ),
                  filled: true,
                  fillColor: ColorApp.lightGrey,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
              child: TextFormField(
                controller: _emailController,
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
                  contentPadding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
              child: TextFormField(
                controller: _passwordController,
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
                  contentPadding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
              child: TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: ColorApp.black),
                  labelText: "Xác nhận mật khẩu",
                  hintText: "Nhập xác nhận mật khẩu...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0.w),
                  ),
                  filled: true,
                  fillColor: ColorApp.lightGrey,
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
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
                onPressed: () {
                  doRegister();
                },
                child: const Text(
                  "Đăng ký",
                  style: TextStyle(color: ColorApp.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: ColorApp.lightBlue0121,
                    padding:
                        EdgeInsets.symmetric(horizontal: 83.w, vertical: 7.w),
                    textStyle: TextStyle(
                      fontSize: 32.w,
                    ),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: ColorApp.white),
                        borderRadius: BorderRadius.circular(24.w)))),
          ],
        )),
      ),
    );
  }
}
