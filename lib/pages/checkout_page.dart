import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/home/widget/checkoout_card.dart';
import 'package:store/pages/home/widget/loading.dart';
import 'package:store/providers/auth_provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/transaction_provider.dart';
import 'package:store/theme.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);


    checkouthandle() async {
    setState(() {
      isloading = true;
    });
      if (await transactionProvider.checkout(
        authProvider.user!.token!,
        cartProvider.totalPrice(),
        cartProvider.cart,
      )) {
        cartProvider.cart = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-done', (route) => false);
      }
    setState(() {
      isloading = false;
    });
    }


    Widget isi() {
      return ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Container(
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'List Items',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  Column(
                    children:
                        cartProvider.cart.map((e) => CheckoutCard(e)).toList(),
                  ),
                  Container()
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            padding: EdgeInsets.all(
              defaultMargin,
            ),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/icon_location_store.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/icon_line.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/icon_location_youraddress.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Store Location',
                          style: fourTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Adidas Core',
                          style: primaryTextStyle.copyWith(
                              fontWeight: medium, fontSize: 14),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Your Address',
                          style: fourTextStyle.copyWith(
                              fontWeight: light, fontSize: 12),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Marsemoon',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Quantity',
                          style: fourTextStyle.copyWith(fontSize: 12),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          'Product Price',
                          style: fourTextStyle.copyWith(fontSize: 12),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          'Shipping',
                          style: fourTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${cartProvider.totalItem()} Items',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$${cartProvider.totalPrice()}',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Free',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Divider(
                  color: Color(0xff2E3141),
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      '\$${cartProvider.totalPrice()}',
                      style: priceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semibold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: backgroundColor5,
            thickness: 1,
          ),
          isloading
              ? Container(margin: EdgeInsets.only(bottom: 30, left: defaultMargin, right: defaultMargin), child: Loading())
              : Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: defaultMargin,
                    horizontal: defaultMargin
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    onPressed: checkouthandle,
                    child: Text(
                      'Checkout Now',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 10,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text('Checkout Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: isi(),
    );
  }
}
