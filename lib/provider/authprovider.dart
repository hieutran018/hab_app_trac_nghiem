import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hab_app_trac_nghiem/app/app_url.dart';
import 'package:hab_app_trac_nghiem/app/shared_preferences.dart';
import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum Status {
  notLoggedIn,
  notRegistered,
  loggedIn,
  registered,
  authenticating,
  registering,
  loggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.notLoggedIn;
  Status _registeredInStatus = Status.notRegistered;

  Status get loggedInStatus => _loggedInStatus;
  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  Future<FutureOr> register(
      String email, String password, String firstName, String lastName) async {
    final Map<String, dynamic> apiBodyData = {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
    };

    return await http
        .post(Uri.parse(AppUrl.register),
            body: json.encode(apiBodyData),
            headers: {'Content-Type': 'application/json; charset=UTF-8'})
        .then(onValue)
        .catchError(onError);
  }

  notify() {
    notifyListeners();
  }

  static Future<FutureOr> onValue(Response response) async {
    bool result;

    final Map<String, dynamic> responseData = json.decode(response.body);

    // print(responseData);

    if (response.statusCode == 200) {
      // var userData = responseData['data'];

      // now we will create a user model
      User authUser = User.fromJson(responseData);

      // now we will create shared preferences and save data
      UserPreferences().saveUser(authUser);

      result = true;
    } else {
      result = false;
    }
    return result;
  }

  static onError(error) {
    print(['ERROR!', error]);
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
