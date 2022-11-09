import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/pages/checkout_page.dart';
import 'package:store/pages/checkout_page_done.dart';
import 'package:store/pages/home/cart_page.dart';
import 'package:store/pages/home/detail_chat_page.dart';
import 'package:store/pages/home/edit_profile.dart';
import 'package:store/pages/home/main.dart';
import 'package:store/pages/sign-in_page.dart';
import 'package:store/pages/sign-up_page.dart';
import 'package:store/providers/auth_provider.dart';
import 'package:store/providers/cart_provider.dart';
import 'package:store/providers/product_provider.dart';
import 'package:store/providers/transaction_provider.dart';
import 'package:store/providers/wishlist_provider.dart';
import 'theme.dart';
import 'pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (home) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => pageMain(),
          '/edit_profile': (context) => EditProfile(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-done': (context) => CheckoutDone(),
        },
      ),
    );
  }
}
