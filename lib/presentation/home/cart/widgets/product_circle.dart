import 'package:badges/badges.dart' as badges;
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:grocery/domain/product/product.dart';
import 'package:grocery/presentation/common/app_colors.dart';

class ProductCircle extends StatelessWidget {
  const ProductCircle(
      {super.key,
      required this.productOrNothing,
      required this.count,
      required this.isItRowLayout});
  final Option<Product> productOrNothing;
  final int count;
  final bool isItRowLayout;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [
        FadeEffect(curve: Curves.fastEaseInToSlowEaseOut),
        ScaleEffect(curve: Curves.fastEaseInToSlowEaseOut)
      ],
      child: Container(
          width: 50,
          height: 50,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: badges.Badge(
            showBadge: count > 1 && isItRowLayout,
            position: badges.BadgePosition.bottomEnd(bottom: -8, end: -5),
            badgeContent: Text(count.toString(),
                style: const TextStyle(color: Colors.white)),
            badgeStyle:
                const badges.BadgeStyle(badgeColor: AppColors.primaryColor),
            child: productOrNothing.fold(
                () => const Icon(Icons.production_quantity_limits),
                (product) => Image.asset(product.imageUrl)),
          )),
    );
  }
}
