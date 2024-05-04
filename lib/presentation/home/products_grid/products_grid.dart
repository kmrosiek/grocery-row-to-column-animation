import 'package:flutter/material.dart';
import 'package:grocery/presentation/home/products_grid/product_card/product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
    );
  }
}
