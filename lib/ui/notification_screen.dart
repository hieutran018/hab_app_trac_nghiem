import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
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
                    "Thông báo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.w,
                        fontWeight: FontWeight.w900,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                )),
            SizedBox(
              height: 5.w,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100.w,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(
                              width: 0.1.w,
                              color: const Color.fromARGB(255, 90, 90, 90))),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(13.w, 0.w, 0.w, 0.w),
                            child: CircleAvatar(
                              child: SvgPicture.asset(
                                  "assets/images/components/noti_friend.svg"),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(8.w, 0.w, 8.w, 0.w),
                              child: Container(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                height: 50.w,
                                width: 350.w,
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Trần Dương Chí Hiếu",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.w)),
                                    TextSpan(
                                        text:
                                            " đã gửi cho bạn lời mời kết bạn.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.w)),
                                  ]),
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
