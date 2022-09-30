import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hab_app_trac_nghiem/app/shared_preferences.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:hab_app_trac_nghiem/provider/authprovider.dart';
import 'package:hab_app_trac_nghiem/provider/user_provider.dart';
import 'package:hab_app_trac_nghiem/ui/login_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/main_screen.dart';
import 'package:hab_app_trac_nghiem/ui/register_screen.dart';
import 'package:provider/provider.dart';
// import 'package:hab_app_trac_nghiem/ui/login_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/flash_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/login_screen.dart';
// import 'package:hab_app_trac_nghiem/ui/register_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: FutureBuilder(
                  future: getUserData(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const CircularProgressIndicator();
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      default:
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return const RegisterScreen();
                        }
                    }
                  }),
              routes: {
                '/login': (context) => const LoginScreen(),
                '/register': (context) => const RegisterScreen(),
                // '/dashboard': (context) => DashBoard()
              },
            );
          }),
    );
  }
}
