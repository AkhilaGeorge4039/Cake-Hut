import 'package:flutter/material.dart';
import 'package:cakeshop_flutter/models/product.dart';
import 'package:cakeshop_flutter/models/products.dart';
import 'package:provider/provider.dart';

import '../pages/product_details.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  const ProductCard({
    super.key,
    required this.product,
  });

  // add to cart button pressed
  void addToCart(BuildContext context) {
    // show a dialog box to ask user to confirm to add to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content:  Text("Add this item to your cart?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              //add to Cart
              context.read<Shop>().addToCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product details page on tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //product image
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    child: Image.asset(product.imagePath),
                  ),
                ),

                const SizedBox(height: 1),

                //product name
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
// product price
                Text(
                  '\$' + product.price.toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            //product price + add to cart button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // add to cart button
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: const Icon(Icons.add),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
