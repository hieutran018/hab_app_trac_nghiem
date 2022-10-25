import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';

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
              padding: EdgeInsets.only(top: 9.w),
              child: Container(
                width: 250.w,
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
                      "Lời mời kết bạn",
                      style: GoogleFonts.inter(
                          color: ColorApp.white, fontSize: 30.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18.0.w, 10.0.h, 18.0.w, 0.h),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 150.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: ColorApp.darkGrey11103,
                    border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    borderRadius: BorderRadius.circular(24.w),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(RequestFriendScreen.route);
                    },
                    child: Center(
                      child: Text('Bạn bè',
                          style: GoogleFonts.inter(
                              fontSize: 20.w,
                              fontWeight: FontWeight.w700,
                              color: ColorApp.darkGrey)),
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 0.h),
              child: const Divider(
                color: Color.fromRGBO(128, 128, 128, 0.5),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(15.w, 0.w, 265.w, 0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Lời mời kết bạn',
                        style: GoogleFonts.inter(
                            color: ColorApp.darkGrey,
                            fontWeight: FontWeight.w700,
                            fontSize: 25.sp)),
                  ],
                )),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.all(5.w),
                        child: Container(
                          height: 220.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorApp.darkGrey),
                              borderRadius: BorderRadius.circular(20.w),
                              color: ColorApp.white),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    child: Image.asset(
                                        'assets/images/components/avatar_1.png'),
                                  ),
                                  title: Text("Dương Nghĩa Hiệp",
                                      style: GoogleFonts.inter(
                                          fontSize: 32.sp,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 8.h, right: 8.w),
                                        child: Container(
                                          height: 60.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                              color: ColorApp.lightBlue0121,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.w))),
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Text("Xác nhận",
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20.sp,
                                                      color: ColorApp.white))),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 8.h, right: 8.w),
                                        child: Container(
                                          height: 60.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                              color: ColorApp.white,
                                              border: Border.all(
                                                  color:
                                                      ColorApp.lightBlue0121),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.w))),
                                          child: TextButton(
                                              onPressed: () {},
                                              child: Text("Hủy",
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 20.sp,
                                                      color: ColorApp
                                                          .lightBlue0121))),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                        ));
                  }),
            )
          ],
        ));
  }
}
