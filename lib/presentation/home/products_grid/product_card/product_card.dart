import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/assets.dart';
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
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cabbage'),
                      Text('Fruits'),
                      Text('\$20.00/kg'),
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
