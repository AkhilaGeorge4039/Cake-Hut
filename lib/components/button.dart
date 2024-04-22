import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const Button({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(15),
          child: child,
        )
    );
  }
}