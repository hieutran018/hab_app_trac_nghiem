import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/challenger/select_topic.dart';

class RequestPlayGameScreen extends StatefulWidget {
  const RequestPlayGameScreen({Key? key}) : super(key: key);
  static String route = "/requestplaygame";

  @override
  State<RequestPlayGameScreen> createState() => RequestPlayGameScreenState();
}

class RequestPlayGameScreenState extends State<RequestPlayGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          scaffoldBackgroundColor: const Color.fromRGBO(66, 194, 255, 1)),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.navigate_before_sharp,
                          size: 50.w,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 10.w, 10.w, 5.w),
                            child: Text(
                              "Phần chơi THÁCH ĐẤU",
                              style: GoogleFonts.inter(
                                  fontSize: 20.w,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 5.w, 0.w, 10.w),
                            child: Text(
                              "Chọn đối thủ nào <:",
                              style: GoogleFonts.inter(
                                  fontSize: 25.w,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8.w, 20.w, 8.w, 0.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.w),
                          topRight: Radius.circular(12.w)),
                    ),
                    child: ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(8.w),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                color: const Color.fromARGB(255, 0, 243, 182),
                              ),
                              child: SizedBox(
                                  width: 200.w,
                                  height: 70.w,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 5.w),
                                      Image.asset(
                                          "assets/images/components/ic_reward_no_1.png"),
                                      SizedBox(width: 5.w),
                                      Image.asset(
                                          "assets/images/components/avatar.png"),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "Trần Dương Chí Hiếu",
                                        style: GoogleFonts.inter(
                                          fontSize: 18.w,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              255, 122, 0, 1),
                                        ),
                                      ),
                                      SizedBox(width: 40.w),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pushNamed(
                                                  SelectTopicChallengerGameScreen
                                                      .route);
                                        },
                                        icon: Image.asset(
                                            'assets/images/components/knight.png'),
                                        iconSize: 50.w,
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
