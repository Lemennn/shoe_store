import 'package:flutter/cupertino.dart';
import 'package:store/models/product_models.dart';

class WishlistProvider with ChangeNotifier{
  List<ProductModel> _wishlist= [];
  List<ProductModel> get wishlist => _wishlist;

  set wishlist(List<ProductModel> wishlist){
    _wishlist = wishlist;
    notifyListeners();
  }

  setwishlist (ProductModel product) {
    if(!iswishlist(product)){
      _wishlist.add(product);
    }else{
      _wishlist.removeWhere((element) => element.id == product.id);
    }
    notifyListeners();
  }

  iswishlist (ProductModel product){
    if(_wishlist.indexWhere((element) => element.id == product.id) == -1){
      return false;
    }else{
      return true;
    }
  }

}