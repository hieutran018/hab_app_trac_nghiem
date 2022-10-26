import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
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
          width: 300.w,
          height: 60.h,
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.white),
            color: ColorApp.blue,
            borderRadius: BorderRadius.circular(24.w),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0.w, 3.w, 0.w, 3.w),
            child: Center(
              child: Text(
                "Thông tin tài khoản",
                style:
                    GoogleFonts.inter(color: ColorApp.white, fontSize: 30.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: ColorApp.white,
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
                top: 100.w,
                left: MediaQuery.of(context).size.width / 2 - 40.w,
                child: const CircleAvatar(
                  backgroundColor: ColorApp.white,
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
                child: ElevatedButton(
                    onPressed: () {
                      _buildFailUpdateInfoDialog();
                    },
                    child: const Text(
                      "Hoàn tất",
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
          return const UpdateInfoSuccess();
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
