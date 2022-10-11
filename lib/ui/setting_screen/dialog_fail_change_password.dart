import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        side: const BorderSide(color: Color.fromRGBO(255, 82, 82, 1)),
        borderRadius: BorderRadius.circular(30),
      ),
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          color: const Color.fromRGBO(255, 82, 82, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Thông báo",
            style: TextStyle(
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontSize: 35.w,
            ),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 50),
            child: Text(
              "Thay đổi mật khẩu thất bại!",
              style: TextStyle(fontSize: 30.w),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 150.w,
                height: 50.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: const Color.fromRGBO(255, 171, 64, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Xác nhận",
                    style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 20.w),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
