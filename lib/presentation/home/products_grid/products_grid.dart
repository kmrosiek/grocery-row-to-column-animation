import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/app_colors.dart';
import 'package:grocery/presentation/home/products_grid/product_card/product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.greyBackground),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
            //borderRadius: BorderRadius.vertical(bottom: Radius.circular(18.0)),
            color: Colors.white),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.8,
          children: const [
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}
