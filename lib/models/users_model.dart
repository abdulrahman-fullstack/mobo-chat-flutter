import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  static String name = 'name';
  static String email = 'email';
  static String uid = 'uid';
  static String deviceToken = 'deviceToken';
  static String lastLogin = 'lastLogin';
}

class AppUser {
  final String name;
  final String email;
  final String uid;
  final List<String> deviceToken;
  final Timestamp lastLogin;

  AppUser({this.name, this.email, this.uid, this.deviceToken, this.lastLogin});

  factory AppUser.fromMap(Map data) {
    return AppUser(
      name: data[UsersModel.name] ?? '',
      email: data[UsersModel.email] ?? '',
      uid: data[UsersModel.uid] ?? '',
      deviceToken: data[UsersModel.deviceToken] ?? [],
      lastLogin: data[UsersModel.lastLogin] ?? Timestamp.now(),
    );
  }

  factory AppUser.fromFirestore(DocumentSnapshot snapshot) {
    final Map data = snapshot.data();
    return AppUser.fromMap(data);
  }
}
