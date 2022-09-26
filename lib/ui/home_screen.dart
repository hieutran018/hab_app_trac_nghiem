import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroke_text/stroke_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 16.w, 6.w, 0.w),
          child: Container(
            height: 50.w,
            color: const Color.fromRGBO(0, 240, 255, 1),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                      padding: EdgeInsets.fromLTRB(18, 13, 0, 13),
                      child: StrokeText(
                        text: 'Tin mới nhất',
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        strokeColor: Color.fromRGBO(255, 0, 0, 1),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.w, 16.w, 8.w, 16.w),
                    child: InkWell(
                      onTap: () {},
                      child: const Text('Xem thêm'),
                    ),
                  )
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 0.w, 6.w, 0.w),
          child: Column(
            children: [
              Container(
                  width: 416.w,
                  height: 223.w,
                  color: const Color.fromARGB(255, 236, 234, 234)),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 3.w, 3.w, 0),
                        child: Container(
                            width: 136.w,
                            height: 138.w,
                            color: const Color.fromARGB(255, 236, 234, 234)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 3.w, 3.w, 0),
                        child: Container(
                            width: 136.w,
                            height: 138.w,
                            color: Color.fromARGB(255, 158, 114, 114)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.w, 3.w, 0.w, 0),
                        child: Container(
                            width: 136.w,
                            height: 138.w,
                            color: Color.fromARGB(255, 128, 115, 115)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3.w, 3.w, 0.w, 0),
                        child: Container(
                            width: 136.w,
                            height: 138.w,
                            color: Color.fromARGB(255, 87, 82, 82)),
                      )
                    ],
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 16.w, 6.w, 0.w),
          child: Container(
            height: 50.w,
            color: const Color.fromRGBO(0, 240, 255, 1),
            child: Row(children: const [
              Padding(
                  padding: EdgeInsets.fromLTRB(18, 13, 0, 13),
                  child: StrokeText(
                    text: 'Bảng xếp hạng người chơi',
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    strokeColor: Color.fromRGBO(255, 0, 0, 1),
                  )),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 0.w, 6.w, 0.w),
          child: Column(
            children: [
              Container(
                  width: 416.w,
                  height: 265.w,
                  color: const Color.fromARGB(255, 236, 234, 234)),
            ],
          ),
        ),
      ],
    ));
  }
}
