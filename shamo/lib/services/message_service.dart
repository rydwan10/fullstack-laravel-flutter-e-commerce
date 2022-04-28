import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserId({required int userId}) {
    try {
      return firestore
          .collection("messages")
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort((MessageModel a, MessageModel b) =>
            a.createdAt.compareTo(b.createdAt));
        return result;
      });
    } catch (e) {
      throw Exception("Failed to load user Messages");
    }
  }

  Future<void> addMessages(
      {required UserModel user,
      required bool isFromUser,
      required String message,
      required ProductModel product}) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product': product is UninitializeProductModel ? {} : product.toJson(),
        'created_at': DateTime.now().toString(),
        'updated_at': DateTime.now().toString()
      }).then((value) => print('Message sucessfully send'));
    } catch (e) {
      throw Exception("Message failed to send");
    }
  }
}
