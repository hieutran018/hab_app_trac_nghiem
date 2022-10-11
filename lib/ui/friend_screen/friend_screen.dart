import 'package:flutter/cupertino.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({Key? key}) : super(key: key);

  @override
  State<FriendScreen> createState() => FriendScreenState();
}

class FriendScreenState extends State<FriendScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Friend Screen"),
    );
  }
}
