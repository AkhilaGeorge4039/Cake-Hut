import 'package:flutter/material.dart';
import '/components/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset(
              'assets/logoimage.jpg',
              width: 150,
              height: 150,
            ),

            const SizedBox(height: 25),

            //title
            Text("Cake Hut", style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),),

            const SizedBox(height: 10),

            //subtitle
            Text("The Online Cake Store!", style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 18,
            ),),

            const SizedBox(height: 25),

            //button
            Button(
              onTap: () => Navigator.pushNamed(context, '/login'),
              child: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );

  }
}