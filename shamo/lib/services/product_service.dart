import 'dart:convert';
import 'dart:developer';

import 'package:shamo/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = "http://192.168.222.140:8000/api";

  Future<List<ProductModel>> getProducts() async {
    var url = "$baseUrl/products";
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    // log(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      log(data.toString());
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.toJson(item));
      }
      log("products => $products");
      return products;
    } else {
      throw Exception("Failed to load products");
    }
  }
}
