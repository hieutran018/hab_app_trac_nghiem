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
            height: 70.w,
            color: const Color.fromRGBO(0, 240, 255, 1),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(18, 13, 0, 13),
                      child: StrokeText(
                        text: 'Tin mới nhất',
                        textStyle: TextStyle(
                          fontSize: 20.0.w,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                        strokeColor: const Color.fromARGB(255, 255, 255, 255),
                      )),
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(0.w, 16.w, 8.w, 16.w),
                  //   child: InkWell(
                  //     onTap: () {},
                  //     child: const Text(
                  //       'Xem thêm >>',
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // )
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 0.w, 6.w, 0.w),
          child: Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 500.w,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.w, 3.w, 3.w, 0.w),
                                  child: SizedBox(
                                      width: 400.w,
                                      child: Container(
                                          width: 400.w,
                                          color: const Color.fromRGBO(
                                              217, 217, 217, 1),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5.w, 5.w, 5.w, 0.w),
                                                child: Image.asset(
                                                  "assets/images/thumbnail/thumbnail_news_1.png",
                                                  height: 350.w,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5.w, 5.w, 5.w, 0.w),
                                                child: Text(
                                                  "Trạm Thiên Cung cân bằng nhiệt thế nào ở độ cao...",
                                                  style: TextStyle(
                                                    fontSize: 17.w,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      5.w, 5.w, 5.w, 0.w),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5.w,
                                                                40.w,
                                                                5.w,
                                                                0.w),
                                                        child: RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                WidgetSpan(
                                                                  child: Icon(
                                                                      Icons
                                                                          .calendar_month_rounded,
                                                                      size:
                                                                          20.w),
                                                                ),
                                                                TextSpan(
                                                                    text:
                                                                        "20/09/2022",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            20.w)),
                                                              ]),
                                                        ),
                                                      )
                                                    ],
                                                  ))
                                            ],
                                          ))),
                                )),
                      )
                    ],
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6.w, 16.w, 6.w, 0.w),
          child: Container(
            height: 70.w,
            color: const Color.fromRGBO(0, 240, 255, 1),
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(18, 13, 0, 13),
                  child: StrokeText(
                    text: 'Bảng xếp hạng người chơi',
                    textStyle: TextStyle(
                      fontSize: 20.0.w,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                    strokeColor: const Color.fromARGB(255, 255, 255, 255),
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
                height: 600.w,
                color: const Color.fromARGB(255, 236, 234, 234),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.w),
                        color: Colors.white,
                        border: Border.all(
                            width: 2.w,
                            color: const Color.fromRGBO(255, 0, 0, 1)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3.w, 5.w, 3.w, 3.w),
                        child: Text(
                          "NGƯỜI CHƠI THÁCH ĐẤU",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.w,
                              color: const Color.fromRGBO(255, 0, 0, 1),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 550.w,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(8.w),
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.w),
                                  color: const Color.fromARGB(255, 0, 243, 182),
                                ),
                                child: SizedBox(
                                    width: 200.w,
                                    height: 90.w,
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10.w),
                                        Image.asset(
                                            "assets/images/components/ic_reward_no_1.png"),
                                        SizedBox(width: 15.w),
                                        Image.asset(
                                            "assets/images/components/avatar.png"),
                                        SizedBox(width: 15.w),
                                        const Text("Trần Dương Chí Hiếu"),
                                        SizedBox(width: 40.w),
                                        const Text("100"),
                                      ],
                                    )),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
