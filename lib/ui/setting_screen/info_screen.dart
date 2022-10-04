import 'package:flutter/material.dart';
class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
    ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: 20,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white
            ),
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),

          ),
          child: Center(child: Text("Thông tin tài khoản",
          style: TextStyle(
            color: Colors.white
          ),),),
        )
      ],
    ),
    );
  }
}
