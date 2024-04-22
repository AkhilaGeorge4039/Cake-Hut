import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../components/button.dart';
import '../components/menu_drawer.dart';
import '../models/products.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cvvController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cardHolderNameController = TextEditingController();

  // Define the _showThankYouPopup method
  void _showThankYouPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min, // Use min size for the column
            children: [
              Text('🎊', style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
              SizedBox(height: 16), // Spacing between emoji and text
              Text('Thank you for your order!')
                  .animate(onPlay: (controller) => controller.forward())
                  .shake(duration: 1000.ms),
            ],
          ),
          actions: [
            //OK button
            MaterialButton(
              onPressed: () {
                // First, clear the cart.
                Provider.of<Shop>(context, listen: false).clearCart();

                // Then, navigate to the products page and remove all previous routes.
                Navigator.of(context).pushNamedAndRemoveUntil('/products', (Route<dynamic> route) => false);
              },
              child: Text("OK"),
            ),

          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Checkout"),
      ),
      drawer: const MenuDrawer(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Name field
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter your name';
                return null;
              },
            ),
            // Phone field
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number',
                  focusColor: Theme.of(context).colorScheme.onSecondary),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter your phone number';
                if (!RegExp(r'^\+?[\d -]{7,15}$').hasMatch(value))
                  return 'Please enter a valid phone number';
                return null;
              },
            ),
            // Address field
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter your address';
                return null;
              },
            ),
            // Email field
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email Address'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter your email address';
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value))
                  return 'Please enter a valid email address';
                return null;
              },
            ),
            // Card Number field
            TextFormField(
              controller: _cardNumberController,
              decoration: InputDecoration(labelText: 'Card Number'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter your card number';
                if (value.length != 16) return 'Card number must be 16 digits';
                return null;
              },
            ),
            // Card Holder Name field
            TextFormField(
              controller: _cardHolderNameController,
              decoration: InputDecoration(labelText: 'Card Holder Name'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter the card holder name';
                return null;
              },
            ),
            // CVV field
            TextFormField(
              controller: _cvvController,
              decoration: InputDecoration(labelText: 'CVV'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter your CVV';
                if (value.length != 3) return 'CVV must be 3 digits';
                return null;
              },
            ),
            // Expiry Date field
            TextFormField(
              controller: _expiryDateController,
              decoration: InputDecoration(labelText: 'Expiry Date (MM/YY)'),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter your card\'s expiry date';
                if (!RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$').hasMatch(value))
                  return 'Please enter a valid expiry date';
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Checkout button

            GestureDetector(
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {
                  // If the form is valid, show the thank you popup
                  _showThankYouPopup(context);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0), // Optional: Adds rounded corners
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0), // Optional: Adjust padding
                    child: Text(
                      "Confirm and Checkout",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white, // Optional: Set text color to contrast
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _cardNumberController.dispose();
    _cvvController.dispose();
    _expiryDateController.dispose();
    _cardHolderNameController.dispose();
    super.dispose();
  }
}


