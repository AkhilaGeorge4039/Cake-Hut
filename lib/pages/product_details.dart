import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../models/products.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(product.name), // Product name in the app bar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Product Name
            Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 18.0),
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(product.imagePath),
              ),
            ),
            const SizedBox(height: 24.0),
            // Product Price
            Text(
              '\$' + product.price.toStringAsFixed(2),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),

              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            // Product Description
            Text(
              product.description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32.0),
            // Add to Cart Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // double.infinity is the width and 50 is the height
              ),
              onPressed: () {
                // Add product to cart
                context.read<Shop>().addToCart(product);
                // Navigate to the cart page
                Navigator.pushNamed(context, '/cart');
              },
              icon: const Icon(Icons.shopping_cart_outlined),
              label: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
