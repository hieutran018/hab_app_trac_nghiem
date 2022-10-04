import 'package:flutter/material.dart';

import 'package:hab_app_trac_nghiem/ui/setting_screen/success_dialog.dart';

import 'fail_dialog.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({Key? key}) : super(key: key);

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        height: 50,
        width: 30,
        child: Center(
          child: Text(
            "Đổi mật khẩu",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 35,
            ),
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  hintText: 'Nhập mật khẩu hiện tại',
                  labelText: 'Nhập mật khẩu hiện tại',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: 'Nhập mật khẩu mới',
                    labelText: 'Nhập mật khẩu mới',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    hintText: 'Xác nhận mật khẩu',
                    labelText: 'Xác nhận mật khẩu',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Quên mật khẩu?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _buildFailDialog();
                },
                child: Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      "Đổi mật khẩu",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildSuccessDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog();
        });
  }

  _buildFailDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return FailDialog();
        });
  }
}
