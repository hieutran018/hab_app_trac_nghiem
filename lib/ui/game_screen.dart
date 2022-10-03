import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/components/ic_history.png"),
              ),
              Text("Trắc Nghiệm Kiến Thức",
                  style: TextStyle(
                      fontSize: 20.w,
                      color: const Color.fromRGBO(0, 41, 255, 1),
                      fontWeight: FontWeight.w900)),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/images/components/ic_rules.png"),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(142.w, 0.w, 142.w, 0.w),
            child: CircleAvatar(
              radius: 50.w,
              backgroundImage:
                  const AssetImage("assets/images/components/avatar_1.png"),
            ),
          ),
          Container(
            width: 130.w,
            height: 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: Colors.white,
              border: Border.all(
                  width: 2.w, color: const Color.fromRGBO(5, 0, 255, 1)),
            ),
            child: Text(
              "Lượt chơi: 3",
              style: TextStyle(
                  fontSize: 20.w, color: const Color.fromRGBO(5, 0, 255, 1)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 2.w,
          ),
          Container(
            width: 130.w,
            height: 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: const Color.fromRGBO(118, 255, 207, 1),
              border: Border.all(
                  width: 2.w, color: const Color.fromRGBO(118, 255, 70, 1)),
            ),
            child: Text(
              "01 : 00 : 00",
              style: TextStyle(fontSize: 20.w),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(63.w, 8.w, 63.w, 0),
              child: const Divider(
                color: Color.fromRGBO(0, 0, 0, 1),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(49.w, 5.w, 49.w, 0.w),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Chơi đơn",
                    style: TextStyle(color: Color.fromRGBO(64, 82, 238, 1)),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(169, 255, 139, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 83.w, vertical: 7.w),
                      textStyle: TextStyle(
                        fontSize: 32.w,
                      ),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(54, 237, 215, 1)),
                          borderRadius: BorderRadius.circular(24.w))))),
          Padding(
              padding: EdgeInsets.fromLTRB(178.w, 5.w, 178.w, 0.w),
              child: Column(
                children: [
                  const Text("Thứ hạng"),
                  Image.asset("assets/images/components/ic_reward_no_1.png"),
                ],
              )),
          SizedBox(height: 5.w),
          const Text("Điểm cao nhất: 1000"),
          Padding(
              padding: EdgeInsets.fromLTRB(63.w, 8.w, 63.w, 0),
              child: const Divider(
                color: Color.fromRGBO(0, 0, 0, 1),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(49.w, 5.w, 49.w, 0.w),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Thách đấu",
                    style: TextStyle(color: Color.fromRGBO(238, 64, 64, 1)),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(244, 207, 186, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 83.w, vertical: 7.w),
                      textStyle: TextStyle(
                        fontSize: 32.w,
                      ),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(54, 237, 215, 1)),
                          borderRadius: BorderRadius.circular(24.w))))),
          Padding(
              padding: EdgeInsets.fromLTRB(178.w, 5.w, 178.w, 0.w),
              child: Column(
                children: [
                  const Text("Thứ hạng"),
                  Image.asset("assets/images/components/ic_reward_no_1.png"),
                ],
              )),
          SizedBox(height: 5.w),
          const Text("Điểm: 1000"),
        ],
      )),
    );
  }
}
