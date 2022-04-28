import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      bool response =
          await TransactionService().checkout(token, carts, totalPrice);
      if (response) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      //log(e.toString());
      return false;
    }
  }
}
