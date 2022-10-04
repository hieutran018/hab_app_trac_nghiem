import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleGameScreen extends StatefulWidget {
  const SingleGameScreen({Key? key}) : super(key: key);
  static String route = "/signlegame";

  @override
  State<SingleGameScreen> createState() => SingleGameScreenState();
}

class SingleGameScreenState extends State<SingleGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(66, 194, 255, 1),
          leading: const BackButton(color: Color.fromRGBO(255, 255, 255, 1)),
          title: Image.asset(
            "assets/images/components/ic_logo_hab.png",
            width: 45.w,
            height: 55.w,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(61.w, 12.w, 0.w, 0.w),
                    child: Container(
                      width: 306.w,
                      height: 43.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.w),
                        color: const Color.fromRGBO(169, 255, 139, 1),
                      ),
                      child: BorderedText(
                        strokeWidth: 2.0.w,
                        strokeColor: const Color.fromARGB(255, 255, 255, 255),
                        child: Text(
                          'Chơi Đơn',
                          style: GoogleFonts.inter(
                            fontSize: 32.w,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(64, 82, 238, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/components/ic_rules.png"),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(145.w, 5.w, 145.w, 0.w),
                child: Container(
                  width: 130.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: Colors.white,
                    border: Border.all(
                        width: 2.w, color: const Color.fromRGBO(5, 0, 255, 1)),
                  ),
                  child: Text(
                    "Lượt chơi: 3",
                    style: TextStyle(
                        fontSize: 20.w,
                        color: const Color.fromRGBO(5, 0, 255, 1)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(145.w, 5.w, 145.w, 0.w),
                child: Container(
                  width: 130.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: const Color.fromRGBO(118, 255, 207, 1),
                    border: Border.all(
                        width: 2.w,
                        color: const Color.fromRGBO(118, 255, 70, 1)),
                  ),
                  child: Text(
                    "01 : 00 : 00",
                    style: TextStyle(fontSize: 20.w),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
