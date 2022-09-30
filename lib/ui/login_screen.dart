// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(66, 149, 255, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(148.w, 40.w, 148.w, 0.w),
                    child: Image.asset(
                      "assets/images/logo_hab_small.png",
                      width: 132.w,
                      height: 166.w,
                    )),
                SizedBox(
                  height: 35.w,
                ),
                Text("Đăng nhập",
                    style:
                        TextStyle(fontSize: 40.w, fontWeight: FontWeight.w400)),
                Padding(
                  padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelStyle:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      labelText: "Nhập email...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0.w),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.49.w),
                      isDense: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.w, 12.w, 20.w, 12.w),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelStyle:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      labelText: "Nhập mật khẩu...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0.w),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(255, 255, 255, 0.49.w),
                      isDense: true,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.w, 12.w, 20.w, 12.w),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(287.w, 12.w, 49.w, 0.w),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                            fontSize: 12.w, fontWeight: FontWeight.w400),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(151.w, 11.w, 151.w, 0.w),
                  child: Text(
                    "hoặc đăng nhập với",
                    style:
                        TextStyle(fontSize: 12.w, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(120.w, 18.w, 120.w, 0.w),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                ),
                SizedBox(
                  height: 35.w,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(255, 122, 0, 1),
                        padding: EdgeInsets.symmetric(
                            horizontal: 83.w, vertical: 7.w),
                        textStyle: TextStyle(
                          fontSize: 32.w,
                        ),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            borderRadius: BorderRadius.circular(24.w)))),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(color: Color.fromRGBO(100, 0, 255, 1)),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(255, 255, 255, 1),
                        padding: EdgeInsets.symmetric(
                            horizontal: 26.w, vertical: 10.w),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color.fromRGBO(100, 0, 255, 1)),
                            borderRadius: BorderRadius.circular(24.w))))
              ],
            ),
          ),
        ));
  }
}
