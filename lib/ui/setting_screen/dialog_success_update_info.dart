import 'package:flutter/material.dart';

class UpdateInfoSuccess extends StatefulWidget {
  const UpdateInfoSuccess({Key? key}) : super(key: key);

  @override
  State<UpdateInfoSuccess> createState() => _UpdateInfoSuccessState();
}

class _UpdateInfoSuccessState extends State<UpdateInfoSuccess> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.lightBlueAccent),
        borderRadius: BorderRadius.circular(30),
      ),
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Thông báo",
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 50),
              child: Center(
                child: Text(
                  "Cập nhật thông tin tài khoản thành công",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
