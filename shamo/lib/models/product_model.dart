import 'dart:developer';

import 'package:shamo/models/category_model.dart';
import 'package:shamo/models/gallery_model.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  String tags;
  CategoryModel? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GalleryModel>? galleries;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.tags,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.galleries});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price:
          json['price'] is String ? double.parse(json['price']) : json['price'],
      description: json['description'],
      tags: json['tags'],
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      galleries: json['galleries'] == []
          ? []
          : json['galleries']
              .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category?.toJson(),
      'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString()
    };
  }
}

class UninitializeProductModel extends ProductModel {
  UninitializeProductModel()
      : super(name: "", description: "", tags: "", price: 0, id: 0);
}
