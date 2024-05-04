import 'package:flutter/material.dart';

class CountModifier extends StatelessWidget {
  const CountModifier({super.key, required this.icon, required this.onPressed});
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: icon,
      ),
    );
  }
}
