import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/app_colors.dart';
import 'package:grocery/presentation/common/dim.dart';
import 'package:grocery/presentation/home/cart/expanded_cart.dart';
import 'package:grocery/presentation/home/cart/minimized_cart.dart';
import 'package:grocery/presentation/home/cart/widgets/cart_content.dart';

class Cart extends StatelessWidget {
  const Cart(
      {super.key, required this.expanded, required this.toggleCartExpanded});
  final bool expanded;
  final VoidCallback toggleCartExpanded;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: toggleCartExpanded,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: Dim.padding),
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
          color: AppColors.greyBackground,
          boxShadow: [
            if (expanded)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 5, // Blur radius
                offset: const Offset(0, 0), // Offset
              ),
          ],
        ),
        curve: Curves.fastEaseInToSlowEaseOut,
        height: expanded ? 0.75 * screenHeight : 96,
        child: true
            ? CartContent(expanded: expanded)
            : expanded
                ? ExpandedCart(expanded: expanded)
                : const MinimizedCart(),
      ),
    );
  }
}
