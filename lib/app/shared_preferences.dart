import 'package:hab_app_trac_nghiem/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    /*
    final int userId;
    final String avatar;
    final String firstName;
    final String lastName;
    final String email;
    final String address;
    final String phoneNumber;
    final String dateOfBirth;
    final String accessToken;
    final String renewalToken;
    final String status;
    */

    prefs.setInt('userId', user.userId!);
    prefs.setString('userId', user.avatar!);
    prefs.setString('firstName', user.firstName!);
    prefs.setString('lastName', user.lastName!);
    prefs.setString('email', user.email!);
    prefs.setString('address', user.address!);
    prefs.setString('phoneNumber', user.phoneNumber!);
    prefs.setString('dateOfBirth', user.dateOfBirth!);
    prefs.setString('accessToken', user.accessToken!);
    prefs.setString('renewalToken', user.renewalToken!);
    prefs.setString('status', user.status!);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? userId = prefs.getInt("userId");
    String? avatar = prefs.getString("avatar");
    String? firstName = prefs.getString("firstName");
    String? lastName = prefs.getString("lastName");
    String? email = prefs.getString("email");
    String? phoneNumber = prefs.getString("phone");
    String? address = prefs.getString("address");
    String? dateOfBirth = prefs.getString("dateOfBirth");
    String? token = prefs.getString("token");
    String? renewalToken = prefs.getString("renewalToken");
    String? status = prefs.getString("status");

    return User(
        userId: userId,
        avatar: avatar,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
        dateOfBirth: dateOfBirth,
        accessToken: token,
        renewalToken: renewalToken,
        status: status);
  }
}
