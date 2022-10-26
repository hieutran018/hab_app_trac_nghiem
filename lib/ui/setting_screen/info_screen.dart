import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';

import 'dialog_fail_update_info.dart';
import 'dialog_success_update_info.dart';

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
          width: 200.w,
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
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80.w,
                ),
              ),
              Positioned(
                top: 120.w,
                left: 230.w,
                child: const CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  child: Icon(
                    Icons.camera_alt,
                    color: Color.fromRGBO(158, 158, 158, 1),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.w, left: 50.w, right: 50.w),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                    ),
                    hintText: 'ID',
                    labelText: 'ID',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.w, left: 50.w, right: 50.w),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                    ),
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.w, left: 50.w, right: 50.w),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                    ),
                    hintText: 'Họ',
                    labelText: 'Họ',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.w, left: 50.w, right: 50.w),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                    ),
                    hintText: 'Tên',
                    labelText: 'Tên',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.w, left: 50.w, right: 50.w),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                    ),
                    hintText: 'Ngày sinh',
                    labelText: 'Ngày sinh',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.w, left: 40.w, right: 40.w),
                child: Container(
                  height: 50.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.orangeAccent,
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Hoàn tất",
                        style:
                            TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildSuccessUpdateInfoDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return UpdateInfoSuccess();
        });
  }

  _buildFailUpdateInfoDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return UpdateInfoFail();
        });
  }
}
