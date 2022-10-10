import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hab_app_trac_nghiem/ui/friend_screen.dart';
import 'package:hab_app_trac_nghiem/ui/game_screen.dart';
import 'package:hab_app_trac_nghiem/ui/home_screen.dart';
import 'package:hab_app_trac_nghiem/ui/news_screen.dart';
import 'package:hab_app_trac_nghiem/ui/setting_screen/setting_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<Widget> screens() {
    return [
      const HomeScreen(),
      const GameScreen(),
      const FriendScreen(),
      const NewsScreen(),
      const SettingScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: 'Trang chủ',
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.game_controller),
          title: 'Trò chơi',
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.antenna_radiowaves_left_right),
          title: 'Bạn bè',
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.text_bubble),
          title: 'Bài viết',
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings_solid),
        title: 'Cài đặt',
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(66, 194, 255, 1),
        leading: Padding(
          padding: EdgeInsets.fromLTRB(10.w, 10.w, 0.w, 10.w),
          child: Image.asset("assets/images/components/ic_logo_hab.png"),
        ),
        leadingWidth: 60.w,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              },
              icon: Image.asset("assets/images/ic_notification.png"))
        ],
      ),
      body: PersistentTabView(
        context,
        confineInSafeArea: true,
        screens: screens(),
        items: navBarItems(),
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}
