import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/app_colors.dart';

class ProductsCount extends StatelessWidget {
  const ProductsCount({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
