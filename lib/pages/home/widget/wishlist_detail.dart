import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/wishlist_provider.dart';
import 'package:store/theme.dart';

import '../../../models/product_models.dart';

class WishlistDetail extends StatelessWidget {
  final ProductModel product;
  const WishlistDetail(this.product);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 14,
        left: 12,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              '${product.galleries![0].url}',
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product.name}',
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semibold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setwishlist(product);
            },
            child: Image.asset(
              'assets/wishlist_nyala.png',
              width: 34,
              height: 34,
            ),
          ),
        ],
      ),
    );
  }
}
