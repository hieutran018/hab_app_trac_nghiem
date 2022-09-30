class User {
  final int? userId;
  final String? avatar;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? accessToken;
  final String? renewalToken;
  final String? status;

  User(
      {required this.userId,
      required this.avatar,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.address,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.accessToken,
      required this.renewalToken,
      required this.status});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      userId: responseData['id'],
      avatar: responseData['avatar'],
      firstName: responseData['first_name'],
      lastName: responseData['last_name'],
      email: responseData['Email'],
      address: responseData['address'],
      phoneNumber: responseData['phone_number'],
      dateOfBirth: responseData['date_of_birth'],
      accessToken: responseData['access_token'],
      renewalToken: responseData['renewal_token'],
      status: responseData['status'],
    );
  }
}
