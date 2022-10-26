import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestFriendScreen extends StatefulWidget {
  const RequestFriendScreen({Key? key}) : super(key: key);
  static String route = '/requestfriend';

  @override
  State<RequestFriendScreen> createState() => RequestFriendScreenState();
}

class RequestFriendScreenState extends State<RequestFriendScreen> {
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
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 10.w),
                child: Container(
                  width: 200.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: const Color.fromRGBO(66, 194, 255, 1),
                  ),
                  child: Text(
                    "Lời mời kết bạn",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.w,
                        fontWeight: FontWeight.w900,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 0.w, 317.w, 0.w),
              child: Container(
                width: 96.w,
                height: 45.w,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(120, 120, 120, 0.3),
                  border:
                      Border.all(color: const Color.fromRGBO(255, 255, 255, 1)),
                  borderRadius: BorderRadius.circular(24.w),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(RequestFriendScreen.route);
                  },
                  child: Text('Bạn bè',
                      style: GoogleFonts.inter(
                          fontSize: 20.w,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(114, 114, 114, 1))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 18.w, 15.w, 0.w),
              child: const Divider(
                color: Color.fromRGBO(128, 128, 128, 0.5),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(15.w, 0.w, 265.w, 0.w),
                child: Text('Lời mời kết bạn',
                    style: GoogleFonts.inter(
                        color: const Color.fromRGBO(128, 128, 129, 0.7),
                        fontWeight: FontWeight.w700,
                        fontSize: 20.w))),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.fromLTRB(2.w, 2.w, 2.w, 2.w),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0.w, 2.w, 0.w, 2.w),
                          child: Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 45.w,
                                  child: Image.asset(
                                      'assets/images/components/avatar_1.png'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          5.w, 0.w, 0.w, 5.w),
                                      child: Text(
                                        'Dương Nghĩa Hiệp',
                                        style: GoogleFonts.inter(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                            fontSize: 20.w,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            5.w, 0.w, 0.w, 0.w),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 120.w,
                                              height: 45.w,
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    5, 168, 238, 1),
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1)),
                                                borderRadius:
                                                    BorderRadius.circular(10.w),
                                              ),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Text('Xác nhận',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 20.w,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color
                                                                .fromRGBO(
                                                            255, 255, 255, 1))),
                                              ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Container(
                                              width: 120.w,
                                              height: 45.w,
                                              decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    75, 78, 80, 1),
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        255, 255, 255, 1)),
                                                borderRadius:
                                                    BorderRadius.circular(10.w),
                                              ),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Text('Xóa',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 20.w,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: const Color
                                                                .fromRGBO(
                                                            255, 255, 255, 1))),
                                              ),
                                            ),
                                          ],
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            )
          ],
        ));
  }
}
