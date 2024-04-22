import 'package:flutter/material.dart';
import 'package:cakeshop_flutter/pages/login.dart';
import 'package:cakeshop_flutter/pages/registration.dart';
import 'package:cakeshop_flutter/themes/colors.dart';
import 'package:cakeshop_flutter/pages/products.dart';
import 'package:cakeshop_flutter/pages/cart.dart';
import 'package:cakeshop_flutter/pages/checkout.dart';
import 'package:provider/provider.dart';

import 'models/products.dart';
import 'pages/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: colors,
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/registration': (context) => const RegistrationPage(),
        '/products': (context) => const ProductsPage(),
        '/cart': (context) => const CartPage(),
        '/checkout': (context) => CheckoutPage()
      },

    );
  }
}
