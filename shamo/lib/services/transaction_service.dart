import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shamo/environment/global_env.dart';
import 'package:shamo/models/cart_model.dart';

class TransactionService {
  String baseUrl = GlobalEnv.localAPI;

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = "$baseUrl/checkout";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = {
      'address': "Marsemoon",
      'items': carts
          .map((cart) => {'id': cart.product.id, 'quantity': cart.quantity})
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 0,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    log(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to checkout");
    }
  }
}
