import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/menu_drawer.dart';
import '../components/product_card.dart';
import '../models/products.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {

    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: const Text("Products"),
        actions: [
          // go to cart button
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: const MenuDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          const SizedBox(height: 25),
          //shop subtitle
          Center(
            child: Text(
              "Choose from the best products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 19,
              ),
            ),
          ),
          const SizedBox(height: 20),
          //products list
          for (var product in products) ProductCard(product: product),
        ],
      ),
    );
  }
}



