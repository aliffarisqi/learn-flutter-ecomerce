import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //helper function to get full name
  String get fullName => '$firstName $lastName';

  //helper function to get phone number format
  String get formatPhoneN0 => BFormatter.formatPhoneNumber(phoneNumber);

  //static function to split full name and last name
  static List<String> nameParts(fullname) => fullname.split(" ");

  //static function to generate user name
  static String generateUsername(fullname) {
    List<String> nameParts = fullname.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUsername";
    return userNameWithPrefix;
  }

  //static function to reate on empty user model
  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      username: "",
      email: "",
      phoneNumber: "",
      profilePicture: "");

  //convert model to json for starting data in firestore
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  //factory method to create a user model from firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
