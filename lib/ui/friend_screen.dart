import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hab_app_trac_nghiem/ui/request_friend_screen.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({Key? key}) : super(key: key);

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
            width: 201.w,
            height: 30.w,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(255, 255, 255, 1)),
              color: const Color.fromRGBO(66, 192, 255, 1),
              borderRadius: BorderRadius.circular(24.w),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(0.w, 3.w, 0.w, 3.w),
              child: Text(
                "Bạn bè",
                style: GoogleFonts.inter(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 20.w),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(18.w, 20.w, 18.w, 0.w),
            child: SizedBox(
              width: 392.w,
              height: 50.w,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.w)),
                  ),
                  hintText: 'Tìm bạn bè',
                  prefixIcon: const Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.fromLTRB(20.0.w, 10.0.w, 20.0.w, 10.0.w),
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(18.0.w, 10.0.w, 18.0.w, 5.0.w),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('10 người bạn',
                style: GoogleFonts.inter(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 22.w)),
            Container(
              width: 170.w,
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
                child: Text('Lời mời kết bạn',
                    style: GoogleFonts.inter(
                        fontSize: 20.w,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(114, 114, 114, 1))),
              ),
            )
          ]),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 88.w,
                  child: Card(
                    child: ListTile(
                      title: Text(
                        'Dương Nghĩa Hiệp',
                        style: GoogleFonts.inter(
                          fontSize: 20.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 50.w,
                        child: Image.asset(
                          'assets/images/components/avatar.png',
                          width: 75.w,
                          height: 75.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert_rounded)),
                    ),
                  ),
                );
              }),
        )
      ],
    )));
  }
}
