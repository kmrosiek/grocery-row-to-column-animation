import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/assets.dart';
import 'package:grocery/presentation/common/common_product/price_text.dart';
import 'package:grocery/presentation/home/products_grid/product_card/count_badge/count_badge.dart';
import 'package:grocery/presentation/home/products_grid/product_card/product_heart.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Center(child: Image.asset(Assets.cabbage))),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cabbage',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w600)),
                      Text('Fruits',
                          style: Theme.of(context).textTheme.bodySmall),
                      const PriceText(amount: '20.00'),
                    ]),
              )
            ],
          ),
          const Align(alignment: Alignment.topRight, child: CountBadge()),
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
