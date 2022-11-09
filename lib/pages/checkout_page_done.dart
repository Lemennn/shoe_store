import 'package:flutter/material.dart';
import 'package:store/theme.dart';

class CheckoutDone extends StatefulWidget {
  const CheckoutDone({super.key});

  @override
  State<CheckoutDone> createState() => _CheckoutDoneState();
}

class _CheckoutDoneState extends State<CheckoutDone> {
  Widget isi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_keranjang.png',
            width: 80,
            height: 70,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'You made a transaction',
            style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 42,
            width: 189,
            child: Text(
              'Stay at home while we prepare your dream shoes',
              style: fourTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 196,
            height: 44,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
              child: Text(
                'Order Other Shoes',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: 196,
            height: 44,
            decoration: BoxDecoration(
              color: Color(0xff39374B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/cart', (route) => false);
              },
              child: const Text(
                'View My Order',
                style:  TextStyle(
                  color: Color(0xffB7B6BF),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        title: Text('Checkout Success'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: backgroundColor1,
        elevation: 0,
      ),
      body: isi(),
    );
  }
}
