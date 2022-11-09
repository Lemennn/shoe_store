import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/home/widget/cart_product.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/theme.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Widget empty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_keranjang.png',
            width: 80,
            height: 69,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Opss! Your Cart is Empty',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Let\'s find your favorite shoes',
            style: primaryTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 44,
            width: 152,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Explore Store',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget availableCart() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      children: cartProvider.cart.map((e) => CartProduct(e)).toList(),
    );
  }

  Widget customButtomNav() {
    return Container(
      height: 180,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: primaryTextStyle),
                Text(
                  '\$${cartProvider.totalPrice()}',
                  style: priceTextStyle.copyWith(
                      fontSize: 16, fontWeight: semibold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: backgroundColor2,
            thickness: 1,
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: primaryTextColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
      body: cartProvider.cart.isEmpty ? empty() : availableCart(),
      bottomNavigationBar: cartProvider.cart.isEmpty ? SizedBox() : customButtomNav(),
    );
  }
}
