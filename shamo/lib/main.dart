import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:shamo/pages/cart_page.dart';
import 'package:shamo/pages/checkout_page.dart';
import 'package:shamo/pages/checkout_success_page.dart';
import 'package:shamo/pages/edit_profle_page.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/pages/sign_in_page.dart';
import 'package:shamo/pages/sign_up_page.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/providers/transaction_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';

import 'pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage()
        },
      ),
    );
  }
}
