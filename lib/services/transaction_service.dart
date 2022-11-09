import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
      String token, double totalPrice, List<CartModel> cart) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    var body = jsonEncode({
      'address': 'tangerang',
      'items': cart
          .map(
            (e) => {
              'id': e.product!.id,
              'quantity': e.quantity,
            },
          )
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 0
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout');
    }
  }
}
