import 'package:flutter/material.dart';
import 'package:grocery/domain/product/product.dart';

class ProductCartRow extends StatelessWidget {
  const ProductCartRow(
      {super.key,
      required this.fadeInAnimation,
      required this.product,
      required this.count});
  final Animation<double> fadeInAnimation;
  final Product product;
  final int count;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return FadeTransition(
      opacity: fadeInAnimation,
      child: SizedBox(
        width: screenWidth - 100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 12),
            Flexible(
              fit: FlexFit.tight,
              child: Text(product.name, maxLines: 2),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('\$${product.price}/kg x $count'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
