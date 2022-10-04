import 'package:flutter/material.dart';

class FailDialog extends StatefulWidget {
  const FailDialog({Key? key}) : super(key: key);

  @override
  State<FailDialog> createState() => _FailDialogState();
}

class _FailDialogState extends State<FailDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.redAccent),
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "Thay đổi mật khẩu thất bại!",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 50,
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
        ]),
      ),
    );
  }
}
