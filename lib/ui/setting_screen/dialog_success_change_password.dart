import 'package:flutter/material.dart';

class SuccessDialog extends StatefulWidget {
  const SuccessDialog({Key? key}) : super(key: key);

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue),
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 50),
              child: Text(
                "Thay đổi mật khẩu thành công!",
                style: TextStyle(fontSize: 20),
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
