import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<NotificationScreen> {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
    'A',
    'B',
    'C',
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
    600,
    500,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(66, 194, 255, 1),
          title: Center(
              child: Image.asset(
            "assets/images/ic_logo_hab.png",
            width: 45.w,
            height: 55.w,
          )),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
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
                height: 700.w,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.amber[colorCodes[index]],
                        child: Center(child: Text('Entry ${entries[index]}')),
                      );
                    }),
              )
            ],
          )),
        ));
  }
}
