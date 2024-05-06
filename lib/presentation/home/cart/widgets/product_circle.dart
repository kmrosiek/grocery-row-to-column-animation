import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/assets.dart';

class ProductCircle extends StatelessWidget {
  const ProductCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Image.asset(Assets.cabbage),
    );
  }
}
