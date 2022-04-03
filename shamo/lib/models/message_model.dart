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
    return MessageModel(
        userId: json['userId'],
        userName: json['userName'],
        userImage: json['userImage'],
        isFromUser: json['isFromUser'],
        message: json['message'],
        product: json['product'] == {}
            ? UninitializeProductModel()
            : ProductModel.fromJson(json['product']),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'product': product is UninitializeProductModel ? {} : product!.toJson(),
      'message': message,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
