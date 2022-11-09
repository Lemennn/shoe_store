import 'package:flutter/cupertino.dart';
import 'package:store/services/transaction_service.dart';
import '../models/cart_model.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, double totalPrice, List<CartModel> cart) async {
    try {
      if (await TransactionService().checkout(token, totalPrice, cart)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
