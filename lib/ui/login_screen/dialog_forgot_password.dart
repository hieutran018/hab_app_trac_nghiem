import 'package:flutter/material.dart';

import 'dialog_fail_verification.dart';
import 'dialog_success_verification.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
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
            "Quên mật khẩu",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Vui lòng cung cấp địa chỉ email\n"
                "bạn sử dụng đăng ký tài khoản,\n"
                "chúng tôi sẽ gửi mã xác nhận\n"
                "đến tài khoản email của bạn",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  _buildFailVerificationDialog();
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

  _buildSuccessVerificationDialog(){
    return showDialog(context: context, builder: (BuildContext context){
      return SuccessVerificationDialog();
    });
  }

  _buildFailVerificationDialog(){
    return showDialog(context: context, builder: (BuildContext context){
      return FailVerificationDialog();
    });

  }

}
