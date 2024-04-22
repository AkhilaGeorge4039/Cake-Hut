import 'package:flutter/cupertino.dart';
import 'package:cakeshop_flutter/models/product.dart';

class Shop extends ChangeNotifier{

  //products for sale
  final List<Product> _shop = [
    //Product 1
    Product(
        name: "Blueberry Cake",
        price: 45.00,
        description: 'This blueberry breakfast cake is jam-packed with flavor! Delicious blueberries make this breakfast one to make again and again.',
        imagePath: 'assets/blueberrycake.jpg'
    ),
    //Product 2
    Product(
        name: "Chocolate Cake",
        price: 49.99,
        description: 'An easy to make, rich Chocolate Cake is the most craved cake recipe. One bowl, minimal ingredients = a fluffy, tender-moist chocolate cake!',
        imagePath: 'assets/chocolatecake.jpg'
    ),
    //Product 3
    Product(
        name: "Mixed Fruit Cake",
        price: 49.99,
        description: 'This fresh fruit cake is bursting with sweet, juicy seasonal fruit. It’s made with fluffy whipped cream, layers of soft Genoise cake, and any fruit of your choice! This cake is just like the beautiful Asian fruit cakes sold in Korean, Chinese, and Japanese bakeries.',
        imagePath: 'assets/mixedfruitcake.jpg'
    ),
    //Product 4
    Product(
        name: "Orange Cake",
        price: 39.99,
        description: 'Made with fresh orange juice, zest, and a crunchy orange glaze topping, this Ultimate Orange Cake recipe packs a citrus punch in every bite.',
        imagePath: 'assets/orangecake.jpg'
    ),
    //Product 5
    Product(
        name: "Oreo Chocolate Cake",
        price: 40.00,
        description: 'This Chocolate Oreo Cake is to die for. Three layers of moist chocolate cake are filled and frosted with chocolaty, Oreo-packed buttercream, plus more Oreos are layered between the cake layers. It’s an Oreo lover’s dream.',
        imagePath: 'assets/oreochocolatecake.jpg'
    ),
    //Product 6
    Product(
        name: "Rainbow Cake",
        price: 45.00,
        description: 'It is such a festive cake that tastes just as good as it looks! Don’t be intimidated by the layers and colors. This post will walk you through step-by-step how to make a rainbow layer cake that everyone will love. The cake is moist, tender, and has a sweet vanilla flavor throughout.',
        imagePath: 'assets/rainbowcake.jpg'
    ),
    //Product 7
    Product(
        name: "Redvelvet Cake",
        price: 55.00,
        description: 'Red velvet cake tastes like very mild cocoa with a slightly tart edge. The cream cheese frosting is the most forward flavor. Perhaps even more important than the taste is the texture: smooth, soft, tender, and light with creamy icing.',
        imagePath: 'assets/redvelvetcake.jpg'
    ),
    //Product 8
    Product(
        name: "Strawberry Cake",
        price: 45.00,
        description: 'Packed with strawberry flavors and a gorgeous shade of pink, this cake is perfect for any occasion. No box mix or Jell-O in this cake! Made with real strawberries, this cake will steal the show with its light and tender crumb.',
        imagePath: 'assets/strawberrycake.jpg'
    ),
  ];

  // user cart
  List<Product> _cart =[];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear(); // Assuming _cart is a List of cart items.
    notifyListeners(); // Notify listeners to update the UI.
  }

}