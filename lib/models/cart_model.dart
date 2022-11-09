import 'package:store/models/product_models.dart';

class CartModel {
  int? id;
  ProductModel? product;
  int? quantity;
  
  CartModel({
    this.id,
    this.product,
    this.quantity
  });
  
  CartModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    product = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
  }

  Map<String,dynamic> toJson(){
    return {
      'id' : id,
      'product' : product,
      'quantity' : quantity
    };
  }

  totalPrice() {
    return quantity! * product!.price!;
  }
}