import 'package:flutter/src/widgets/framework.dart';
import 'package:store/models/category_models.dart';
import 'package:store/models/gallery_models.dart';

class ProductModel {
  int? id;
  double? price;
  String? name;
  String? description;
  String? tags;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryModel? category;
  List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    this.price,
    this.name,
    this.description,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    category = CategoryModel.fromJson(json['category']);
    galleries = json['galleries'].map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery)).toList();
  }

  Map<String,dynamic> toJson() {
    return {
      'id' : id,
      'name' : name,
      'price' : price,
      'description' : description,
      'tags' : tags,
      'created_at' : createdAt.toString(),
      'updated_at' : updatedAt.toString(),
      'category' : category?.toJson(),
      'galleries' : galleries?.map((gallery) => gallery.toJson()).toList(),
    };
  }

}

class UninitializedProductModel extends ProductModel {
  
}
