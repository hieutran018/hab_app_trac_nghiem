import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/roles_game_single.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/select_topic.dart';

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
        body: SafeArea(
          child: SingleChildScrollView(
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const RolesSingleGame();
                          },
                        );
                      },
                      icon:
                          Image.asset("assets/images/components/ic_rules.png"),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 130.w,
                        height: 30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          color: Colors.white,
                          border: Border.all(
                              width: 2.w,
                              color: const Color.fromRGBO(5, 0, 255, 1)),
                        ),
                        child: Text(
                          "Lượt chơi: 3",
                          style: TextStyle(
                              fontSize: 20.w,
                              color: const Color.fromRGBO(5, 0, 255, 1)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
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
                    ],
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
                                padding:
                                    EdgeInsets.fromLTRB(3.w, 5.w, 3.w, 3.w),
                                child: Text(
                                  "NGƯỜI CHƠI DẪN ĐẦU",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.w,
                                      color: const Color.fromRGBO(255, 0, 0, 1),
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  // physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(8.w),
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.all(5.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.w),
                                          color: const Color.fromARGB(
                                              255, 0, 243, 182),
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
                                                Text(
                                                  "100",
                                                  style: GoogleFonts.inter(
                                                    fontSize: 18.w,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromRGBO(
                                                        255, 122, 0, 1),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(49.w, 5.w, 49.w, 10.w),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushNamed(
                                        SelectTopicSingleGameScreen.route);
                              },
                              child: const Text(
                                "Chơi",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(26, 103, 246, 1),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 83.w, vertical: 7.w),
                                  textStyle: TextStyle(
                                    fontSize: 32.w,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)),
                                      borderRadius:
                                          BorderRadius.circular(24.w))))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
