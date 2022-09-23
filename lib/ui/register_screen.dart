import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(66, 149, 255, 1),
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
                  height: 166.w,
                )),
            SizedBox(
              height: 35.w,
            ),
            Text("Đăng ký tài khoản",
                style: TextStyle(fontSize: 40.w, fontWeight: FontWeight.w400)),
            Padding(
              padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  labelText: "Nhập họ...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0.w),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(255, 255, 255, 0.49.w),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20.w, 12.w, 20.w, 12.w),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  labelText: "Nhập tên...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0.w),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(255, 255, 255, 0.49.w),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20.w, 12.w, 20.w, 12.w),
                ),
              ),
            ),
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
                  contentPadding: EdgeInsets.fromLTRB(20.w, 12.w, 20.w, 12.w),
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
                  contentPadding: EdgeInsets.fromLTRB(20.w, 12.w, 20.w, 12.w),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(49.w, 17.w, 49.w, 0.w),
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  labelText: "Xác nhận mật khẩu...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0.w),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(255, 255, 255, 0.49.w),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(20.w, 12.w, 20.w, 12.w),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(182.w, 5.w, 48.w, 0.w),
                child: InkWell(
                  onTap: () {},
                  child: Text("Đã có tài khoản? Đi đến đăng nhập",
                      style: TextStyle(fontSize: 12.w)),
                )),
            SizedBox(height: 25.w),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Đăng ký",
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(255, 122, 0, 1),
                    padding:
                        EdgeInsets.symmetric(horizontal: 83.w, vertical: 7.w),
                    textStyle: TextStyle(
                      fontSize: 32.w,
                    ),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 1)),
                        borderRadius: BorderRadius.circular(24.w)))),
          ],
        )),
      ),
    );
  }
}
