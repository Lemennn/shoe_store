import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/home/widget/wishlist_detail.dart';
import 'package:store/providers/wishlist_provider.dart';
import 'package:store/theme.dart';

import '../../models/product_models.dart';

class wishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget header() {
      return PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor1,
          centerTitle: true,
          title: const Text('Favorite Shoes'),
          titleTextStyle: primaryTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 18,
          ),
        ),
        preferredSize: const Size.fromHeight(70),
      );
    }

    Widget wishlistEmpty() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_wishlist.png',
                height: 64,
                width: 74,
                color: primaryColor,
              ),
              const SizedBox(
                height: 23,
              ),
              Text(
                ' You don\'t have dream shoes?',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Let\'s find your favorite shoes',
                style: secondaryTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget wishlistAvailabe() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: ListView(
            children:
                wishlistProvider.wishlist.map((e) => WishlistDetail(e)).toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        wishlistProvider.wishlist.length == 0 ? wishlistEmpty() : wishlistAvailabe(),
      ],
    );
  }
}
