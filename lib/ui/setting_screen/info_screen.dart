import 'package:flutter/cupertino.dart';
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
      body: ListView(
        children: [
          Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                ),
              ),
              Positioned(
                top: 120,
                left: 230,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 50, right: 50),
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
                padding: EdgeInsets.only(top: 20, left: 50, right: 50),
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
                padding: EdgeInsets.only(top: 20, left: 50, right: 50),
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
                padding: EdgeInsets.only(top: 20, left: 50, right: 50),
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
                padding: EdgeInsets.only(top: 20, left: 50, right: 50),
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
                padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.orangeAccent,
                    ),
                    child: Center(
                      child: Text(
                        "Hoàn tất",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
