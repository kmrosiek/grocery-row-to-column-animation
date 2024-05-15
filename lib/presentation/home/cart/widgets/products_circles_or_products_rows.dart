import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/application/products_cubit/products_cubit.dart';
import 'package:grocery/domain/order_item/order_item.dart';
import 'package:grocery/presentation/home/cart/widgets/product_cart_row.dart';
import 'package:grocery/presentation/home/cart/widgets/product_circle.dart';

class ProductsCirclesOrProductsRows extends StatelessWidget {
  const ProductsCirclesOrProductsRows(
      {super.key,
      required this.productIndex,
      required this.orderItems,
      required this.isItRowLayout,
      required this.leftPosition,
      required this.topPosition,
      required this.fadeInAnimation,
      required this.verticalItemsSpacing});
  final int productIndex;
  final List<OrderItem> orderItems;
  final bool isItRowLayout;
  final double leftPosition;
  final double topPosition;
  final Animation<double> fadeInAnimation;
  final double verticalItemsSpacing;

  static const double horizontalItemsSpacing = 60.0;
  static const int singleItemAnimationDelay = 100;

  @override
  Widget build(BuildContext context) {
    final productOrNothing = context
        .read<ProductsCubit>()
        .getProduct(productId: orderItems[productIndex].productId);
    return AnimatedPositioned(
        duration: Duration(
            milliseconds: 300 + productIndex * singleItemAnimationDelay),
        curve: Curves.fastOutSlowIn,
        left: leftPosition +
            (isItRowLayout ? productIndex * horizontalItemsSpacing : 0.0),
        top: topPosition +
            (!isItRowLayout ? productIndex * verticalItemsSpacing : 0.0),
        child: Visibility(
            visible: !(isItRowLayout && productIndex > 3),
            child: Row(
              children: [
                ProductCircle(
                    productOrNothing: productOrNothing,
                    count: orderItems[productIndex].count,
                    isItRowLayout: isItRowLayout),
                if (!isItRowLayout)
                  productOrNothing.fold(
                      () => const Text('   Could not find product'),
                      (product) => ProductCartRow(
                          fadeInAnimation: fadeInAnimation,
                          product: product,
                          count: orderItems[productIndex].count)),
              ],
            )));
  }
}
