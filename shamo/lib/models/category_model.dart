import 'package:flutter/foundation.dart';

class CategoryModel {
  int id;
  String name;

  CategoryModel({required this.id, required this.name});


  // CategoryModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  // }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
