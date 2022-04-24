import 'dart:developer';

import 'package:shamo/models/product_model.dart';
import 'package:shamo/widgets/product_tile.dart';

class MessageModel {
  int userId;
  String userName;
  String userImage;
  bool isFromUser;
  ProductModel? product;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  MessageModel(
      {required this.userId,
      required this.userName,
      required this.userImage,
      required this.isFromUser,
      required this.message,
      required this.createdAt,
      required this.updatedAt,
      this.product});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    log("asdfsdf ${json['product'].isEmpty}");
    return MessageModel(
        userId: json['userId'],
        userName: json['userName'],
        userImage: json['userImage'],
        isFromUser: json['isFromUser'],
        message: json['message'],
        product: json['product'].isEmpty
            ? UninitializeProductModel()
            : ProductModel.fromJson(json['product']),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']));
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'product': product is UninitializeProductModel ? {} : product!.toJson(),
      'message': message,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
