import 'dart:developer';

class UserModel {
  int id;
  String name;
  String email;
  String username;
  String profilePhotoUrl;
  String token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.profilePhotoUrl,
      required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // log(json['token'].toString());
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      profilePhotoUrl: json['profile_photo_url'],
      token: json['token'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
