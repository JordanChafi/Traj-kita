// user_models.dart
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String? profilePhoto;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.profilePhoto,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['ID'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      email: json['Email'],
      phoneNumber: json['PhoneNumber'],
      password: json['Password'],
      profilePhoto: json['ProfilePhoto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'Password': password,
      'ProfilePhoto': profilePhoto,
    };
  }
}
