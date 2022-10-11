import 'package:flutter/material.dart';
class UpdateInfoFail extends StatefulWidget {
  const UpdateInfoFail({Key? key}) : super(key: key);

  @override
  State<UpdateInfoFail> createState() => _UpdateInfoFailState();
}

class _UpdateInfoFailState extends State<UpdateInfoFail> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(30),
      ),
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.redAccent,
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
                  "Cập nhật thông tin tài khoản thất bại",
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
