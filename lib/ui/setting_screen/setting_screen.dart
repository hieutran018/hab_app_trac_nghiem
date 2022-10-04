
import 'package:flutter/material.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/dialog_change_password.dart';

import 'info_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Container(
            // padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.only(top: 10, bottom: 10),
           // width: 20,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Center(
              child: Text(
                "Cài đặt chung",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Huỳnh Nguyễn Vân Anh",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "ID: 002",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Xếp hạng: 01",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        TextButton(
          onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InfoScreen()),
          );

          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Thông tin cá nhân",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.history,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Lịch sử trận đấu",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        TextButton(
          onPressed: () {
            _buildDialog();
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.lock_rounded,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Đổi mật khẩu",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.logout,
                  size: 50,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangePasswordDialog();
      },
    );
  }
}
