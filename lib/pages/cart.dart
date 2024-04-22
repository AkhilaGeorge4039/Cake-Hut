import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/products.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item for cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              //remove from Cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    // Calculate the total
    final double total = cart.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Your Cart"),
      ),

      body:  Column(

        children: [

          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Your cart is empty.."))
                : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // get individual item in cart
                final item = cart[index];

                //return as a cart card UI
                return ListTile(
                  title: Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 20, // Set the size you want for the name
                      //fontWeight: FontWeight.bold, // Optional: if you want the name to be bold
                    ),
                  ),
                  subtitle: Text(
                    item.price.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 18, // Set the size you want for the name
                      fontWeight: FontWeight.bold, // Optional: if you want the name to be bold
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              },
            ),
          ),

          // Total price widget
          if (cart.isNotEmpty) // Only show total if the cart is not empty
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$' + total.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 30.0),

          // Checkout Button
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10.0),
              minimumSize: const Size(400.0, 30.0),// double.infinity is the width and 50 is the height
            ),

            onPressed: () {
              // Navigate to the checkout page
              Navigator.pushNamed(context, '/checkout');
            },
            icon: const Icon(Icons.shopping_cart_checkout),
            label: const Text('Proceed To Checkout'),

          ),
        ],
      ),
    );
  }
}
