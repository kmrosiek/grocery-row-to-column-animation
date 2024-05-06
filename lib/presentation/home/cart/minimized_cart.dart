import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/dim.dart';
import 'package:grocery/presentation/home/cart/widgets/cart_title.dart';
import 'package:grocery/presentation/home/cart/widgets/product_circle.dart';

class MinimizedCart extends StatelessWidget {
  const MinimizedCart({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceBottomPadding = MediaQuery.of(context).padding.bottom;
    return Padding(
      padding: EdgeInsets.only(
          bottom: deviceBottomPadding,
          top: 12.0,
          left: Dim.padding,
          right: Dim.padding),
      child: const Row(
        children: [
          CartTitle(),
          SizedBox(width: 16),
          ProductCircle(),
          Spacer(),
          //ProductsCount(),
        ],
      ),
    );
  }
}
