import 'package:flutter/cupertino.dart';
import 'package:store/models/product_models.dart';
import 'package:store/providers/product_provider.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier{
  List<CartModel> _cart = [];
  List<CartModel> get cart => _cart;

  set cart(List<CartModel> cart) {
    _cart = cart;
    notifyListeners();
  }

  addCart(ProductModel product){
    if(isCart(product)){
      int index = _cart.indexWhere((element) => element.product?.id == product.id);
       _cart[index].quantity = _cart[index].quantity! + 1;
    }else{
      _cart.add(CartModel(
        id: _cart.length,
        product: product,
        quantity: 1
      ));
    }
    notifyListeners();
  }

  addQuantity(int id) {
    _cart[id].quantity = _cart[id].quantity! + 1; 
    notifyListeners();
  }
  reduceQuantity(int id) {
    _cart[id].quantity = _cart[id].quantity! - 1;
    if(_cart[id].quantity == 0){
      _cart.removeAt(id);
    } 
    notifyListeners();
  }
  
  removeCart(int id) {
    _cart.removeAt(id);
    notifyListeners();
  }

  totalItem () {
    int total = 0;
    for(var item in _cart){
      total += item.quantity!;
    }
    return total;
  }
  
  totalPrice (){
    double total = 0;
    for(var item in _cart){
      total += (item.quantity! * item.product!.price!);
    }
    return total;
  }

  isCart(ProductModel product) {
    if(_cart.indexWhere((element) => element.product?.id == product.id) == -1){
      return false;
    }else{
      return true;
    }
  }
}