import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/components/color.dart';
import 'package:hab_app_trac_nghiem/ui/friend_screen/request_friend_screen.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({Key? key}) : super(key: key);
  static String route = 'friendscreen';

  @override
  State<FriendScreen> createState() => FriendScreenState();
}

class FriendScreenState extends State<FriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Center(
            child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 9.w),
          child: Container(
            width: 200.w,
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
                  "Bạn bè",
                  style:
                      GoogleFonts.inter(color: ColorApp.white, fontSize: 30.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(18.w, 20.w, 18.w, 0.w),
            child: SizedBox(
              height: 70.h,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  ),
                  hintText: 'Tìm bạn bè',
                  prefixIcon: const Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.fromLTRB(20.0.w, 10.h, 20.0.w, 10.h),
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(18.0.w, 10.0.w, 18.0.w, 5.0.w),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('10 người bạn',
                style: GoogleFonts.inter(
                    color: ColorApp.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 25.sp)),
            Container(
              width: 200.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: ColorApp.darkGrey11103,
                border:
                    Border.all(color: const Color.fromRGBO(255, 255, 255, 1)),
                borderRadius: BorderRadius.circular(24.w),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(RequestFriendScreen.route);
                },
                child: Center(
                  child: Text('Lời mời kết bạn',
                      style: GoogleFonts.inter(
                          fontSize: 20.w,
                          fontWeight: FontWeight.w700,
                          color: ColorApp.darkGrey)),
                ),
              ),
            )
          ]),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  child: Center(
                    child: Card(
                      child: ListTile(
                        title: Text(
                          'Dương Nghĩa Hiệp',
                          style: GoogleFonts.inter(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Image.asset(
                            'assets/images/components/avatar.png',
                            width: 75.w,
                            height: 75.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert_rounded)),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    )));
  }
}
