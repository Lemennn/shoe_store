import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/user_models.dart';
import 'package:store/pages/detailProduct.dart';
import 'package:store/pages/home/widget/products_arrival.dart';
import 'package:store/pages/home/widget/products_cart.dart';
import 'package:store/providers/auth_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/theme.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel? user = authProvider.user;
    ProductProvider productsProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user?.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '@${user?.username}',
                    style: subTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            ClipOval(
              child: Image.network(
                '${user?.profilePhotoUrl}',
                height: 54,
                width: 54,
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                child: Text(
                  'All Shoes',
                  style: primaryTextStyle.copyWith(fontSize: 13),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparent,
                  border: Border.all(
                    color: subTextColor,
                  ),
                ),
                child: Text(
                  'Running',
                  style: secondaryTextStyle.copyWith(fontSize: 13),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparent,
                  border: Border.all(
                    color: subTextColor,
                  ),
                ),
                child: Text(
                  'Traning',
                  style: secondaryTextStyle.copyWith(fontSize: 13),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparent,
                  border: Border.all(
                    color: subTextColor,
                  ),
                ),
                child: Text(
                  'Basketball',
                  style: secondaryTextStyle.copyWith(fontSize: 13),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                margin: EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparent,
                  border: Border.all(
                    color: subTextColor,
                  ),
                ),
                child: Text(
                  'Haiking',
                  style: secondaryTextStyle.copyWith(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularItem() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Products',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      );
    }

    Widget popularProduct() {
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(top: 14),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: defaultMargin,
                ),
                Row(
                  children: productsProvider.products
                      .map((e) => ProductsCard(e))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget arivalProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Arrivals',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      );
    }

    Widget productsNewArrival() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail_product');
        },
        child: Container(
          margin: EdgeInsets.only(
              top: 14, left: defaultMargin, right: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: productsProvider.products
                .map((e) => productsArival(e))
                .toList(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          header(),
          categories(),
          popularItem(),
          popularProduct(),
          arivalProductsTitle(),
          productsNewArrival(),
        ],
      ),
    );
  }
}
