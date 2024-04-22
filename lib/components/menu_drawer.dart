import 'package:flutter/material.dart';
import 'drawer_list.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              //drawer header: logo
              children: [
                DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 72,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                //shop title
                DrawerList(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pop(context);
                    //go to cart page
                    Navigator.pushNamed(context, '/products');
                  }
                ),

                //cart title
                DrawerList(
                    text: "Cart",
                    icon: Icons.shopping_cart,
                    onTap: () {
                      //pop drawer first
                      Navigator.pop(context);

                      //go to cart page
                      Navigator.pushNamed(context, '/cart');
                    }
                ),
              ],
            ),

            //exit shop title
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: DrawerList(
                text: "Exit",
                icon: Icons.logout,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false),
              ),
            ),
          ],
        )
    );
  }
}
