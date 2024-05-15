import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/application/order_cubit/order_cubit.dart';
import 'package:grocery/presentation/common/dim.dart';
import 'package:grocery/presentation/home/cart/widgets/cart_title.dart';
import 'package:grocery/presentation/home/cart/widgets/products_circles_or_products_rows.dart';
import 'package:grocery/presentation/home/cart/widgets/products_count.dart';

class CartStack extends StatefulWidget {
  const CartStack({super.key, required this.expanded});
  final bool expanded;

  @override
  State<CartStack> createState() => _CartStackState();
}

class _CartStackState extends State<CartStack>
    with SingleTickerProviderStateMixin {
  static const _startingLeftPosition = 60.0;
  static const _startingTopPosition = 50.0;
  double _leftPosition = _startingLeftPosition;
  double _topPosition = 0.0;
  bool _isItRow = true;

  late final AnimationController _fadeInController;

  @override
  void initState() {
    super.initState();
    _fadeInController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _fadeInController.dispose();
    super.dispose();
  }

  void _runExpandCheck() {
    if (widget.expanded && _isItRow) {
      _transformIntoColumn();
    } else if (!widget.expanded && !_isItRow) {
      _transformIntoRow();
    }
  }

  @override
  void didUpdateWidget(CartStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  Animation<double> get _fadeInAnimation => Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _fadeInController,
          curve: Curves.easeIn,
        ),
      );

  void _transformIntoRow() {
    setState(() {
      _leftPosition = _startingLeftPosition;
      _topPosition = 0.0;
      _isItRow = true;
    });
    _fadeInController.forward(from: 0.0);
  }

  void _transformIntoColumn() {
    setState(() {
      _leftPosition = 0.0;
      _topPosition = _startingTopPosition;
      _isItRow = false;
    });
    _fadeInController.forward(from: 0.0);
  }

  static const double verticalItemsSpacing = 70.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseStackHeight = 80;
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final orderItems = state.orderItems;
        final double stackSize = max(
            baseStackHeight + orderItems.length * (verticalItemsSpacing),
            baseStackHeight + verticalItemsSpacing);
        return Container(
          width: screenWidth,
          height: stackSize,
          padding: const EdgeInsets.all(Dim.padding),
          child: Stack(
            children: [
              const Positioned(top: 10, child: CartTitle()),
              for (int index = 0; index < orderItems.length; index++)
                ProductsCirclesOrProductsRows(
                  productIndex: index,
                  orderItems: orderItems,
                  isItRowLayout: _isItRow,
                  leftPosition: _leftPosition,
                  topPosition: _topPosition,
                  fadeInAnimation: _fadeInAnimation,
                  verticalItemsSpacing: verticalItemsSpacing,
                ),
              Positioned(
                  right: 0,
                  child: ProductsCount(
                      count: state.orderItems.fold(
                          0,
                          (itemsCount, orderItem) =>
                              itemsCount += orderItem.count))),
            ],
          ),
        );
      },
    );
  }
}
