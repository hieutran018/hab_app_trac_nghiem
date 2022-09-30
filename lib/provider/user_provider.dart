import 'package:flutter/cupertino.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      accessToken: '',
      address: '',
      avatar: '',
      dateOfBirth: '',
      email: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      renewalToken: '',
      userId: null,
      status: '');

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
