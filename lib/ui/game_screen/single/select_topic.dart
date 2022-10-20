import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen/single/playing_game_screen.dart';

class SelectTopicSingleGameScreen extends StatefulWidget {
  const SelectTopicSingleGameScreen({Key? key}) : super(key: key);
  static String route = "/selecttopicsinglegame";

  @override
  State<SelectTopicSingleGameScreen> createState() =>
      SelectTopicSingleGameScreenState();
}

class SelectTopicSingleGameScreenState
    extends State<SelectTopicSingleGameScreen> {
  static List<String> list = <String>['Dễ', 'Trung bình', 'Khó'];
  String dropdownValue = list.first;

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
                            padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 5.h),
                            child: Text(
                              "Phần chơi THỬ THÁCH",
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
                              "Chọn chủ đề bạn muốn <:",
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
                        padding: EdgeInsets.fromLTRB(4.w, 20.w, 4.w, 0.w),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Container(
                              width: 100.w,
                              height: 130.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          162, 161, 161, 1)),
                                  borderRadius: BorderRadius.circular(20.w),
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          5.w, 10.w, 5.w, 10.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.w),
                                          color: const Color.fromRGBO(
                                              240, 240, 240, 0.824),
                                        ),
                                        child: Image.asset(
                                            'assets/images/components/physic.png'),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        5.w, 10.w, 0.w, 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Khoa học",
                                          style: GoogleFonts.inter(
                                            fontSize: 20.w,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Gồm các câu hỏi trắc nghiệm vật lý cơ bản.",
                                              style: GoogleFonts.inter(
                                                fontSize: 12.w,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        DropdownButton<String>(
                                          value: dropdownValue,
                                          icon:
                                              const Icon(Icons.arrow_downward),
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  66, 194, 255, 1)),
                                          underline: Container(
                                            height: 2,
                                            color: const Color.fromRGBO(
                                                66, 194, 255, 1),
                                          ),
                                          onChanged: (String? value) {
                                            // This is called when the user selects an item.
                                            setState(() {
                                              dropdownValue = value!;
                                            });
                                          },
                                          items: list
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                        Text(
                                          "00:15 giây cho mỗi câu",
                                          style: GoogleFonts.inter(
                                              fontSize: 14.w,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 130.w,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            66, 194, 255, 1),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12.w),
                                          bottomRight: Radius.circular(12.w),
                                        )),
                                    child: IconButton(
                                      icon: const Icon(
                                          Icons.play_arrow_outlined,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)),
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pushNamed(PlayingGameScreen.route);
                                      },
                                    ),
                                  ))
                                ],
                              ),
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
