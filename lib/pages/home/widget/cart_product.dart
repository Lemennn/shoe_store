import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/cart_model.dart';
import 'package:store/theme.dart';

import '../../../providers/cart_provider.dart';

class CartProduct extends StatelessWidget {
  final CartModel product;
  const CartProduct(this.product);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    int count = 0;
    
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  '${product.product!.galleries![0].url}',
                  width: 60,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.product!.name}',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      '\$${product.product!.price}',
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(product.id!);
                    },
                    child: Image.asset(
                      'assets/button_tambah.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${product.quantity}',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(product.id!);
                    },
                    child: Image.asset(
                      'assets/button_kurang.png',
                      width: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  cartProvider.removeCart(product.id!);
                },
                child: Image.asset(
                  'assets/button_remove.png',
                  width: 63,
                  height: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
