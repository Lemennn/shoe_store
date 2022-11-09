import 'package:flutter/material.dart';
import 'package:store/models/cart_model.dart';
import 'package:store/theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  const CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(
        top: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${cart.product!.galleries![0].url}',
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
                  '${cart.product!.name}',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semibold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${cart.product!.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          Text(
            '${cart.quantity} items',
            style: fourTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
