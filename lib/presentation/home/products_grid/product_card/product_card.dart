import 'package:flutter/material.dart';
import 'package:grocery/domain/product/product.dart';
import 'package:grocery/presentation/common/common_product/price_text.dart';
import 'package:grocery/presentation/home/products_grid/product_card/count_badge/count_badge.dart';
import 'package:grocery/presentation/home/products_grid/product_card/product_heart.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Center(child: Image.asset(product.imageUrl))),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w600)),
                      Text('Fruits',
                          style: Theme.of(context).textTheme.bodySmall),
                      PriceText(amount: product.price),
                    ]),
              )
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: CountBadge(productId: product.id)),
          Align(
              alignment: Alignment.bottomRight,
              child: ProductHeart(
                isLiked: false,
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}
