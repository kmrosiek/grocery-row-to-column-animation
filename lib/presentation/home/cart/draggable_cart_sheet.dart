import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/application/order_cubit/order_cubit.dart';
import 'package:grocery/presentation/common/app_colors.dart';
import 'package:grocery/presentation/home/cart/cart_stack.dart';

class DraggableCartSheet extends StatefulWidget {
  const DraggableCartSheet(
      {super.key, required this.cartExpanded, required this.updateExpanded});
  final bool cartExpanded;
  final Function(bool) updateExpanded;

  @override
  State<DraggableCartSheet> createState() => _DraggableCartSheetState();
}

class _DraggableCartSheetState extends State<DraggableCartSheet>
    with SingleTickerProviderStateMixin {
  static const double _defaultMinScrollHeight = 0.2;
  static const double _defaultMaxScrollHeight = 0.7;
  double? _minScrollHeight;
  double? _maxScrollHeight;

  final _dragController = DraggableScrollableController();

  double get _getMinScrollHeight => _minScrollHeight ?? _defaultMinScrollHeight;
  double get _getMaxScrollHeight => _maxScrollHeight ?? _defaultMaxScrollHeight;

  void animateDragOnTap(double height) {
    _dragController.animateTo(
      height,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenHeight = MediaQuery.of(context).size.height;
    _minScrollHeight ??= 100 / screenHeight;
    const double baseStackHeight = 80;
    final int noOfProducts = context.read<OrderCubit>().state.orderItems.length;
    const double verticalItemsSpacing = 70.0;
    final double stackSize =
        baseStackHeight + noOfProducts * (verticalItemsSpacing) + 00;
    _maxScrollHeight = (80 + stackSize) / screenHeight;

    _dragController.addListener(() {
      final newSize = _dragController.size;
      if (newSize <= _getMinScrollHeight + 0.01) {
        widget.updateExpanded(false);
      } else if (newSize >= _getMaxScrollHeight - 0.01) {
        widget.updateExpanded(true);
      }
    });
  }

  @override
  void dispose() {
    _dragController.dispose();
    super.dispose();
  }

  void collapseCart() => animateDragOnTap(_getMinScrollHeight);

  void expandCart() => animateDragOnTap(_getMaxScrollHeight);

  @override
  void didUpdateWidget(DraggableCartSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cartExpanded != widget.cartExpanded) {
      _runExpandCheck();
    }
  }

  void _runExpandCheck() {
    if (widget.cartExpanded) {
      expandCart();
    } else {
      collapseCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    final noOfProducts = context.watch<OrderCubit>().state.orderItems.length;
    return IgnorePointer(
      ignoring: noOfProducts == 0,
      child: DraggableScrollableSheet(
        controller: _dragController,
        initialChildSize: _getMinScrollHeight,
        minChildSize: _getMinScrollHeight,
        maxChildSize: _getMaxScrollHeight,
        snap: true,
        snapAnimationDuration: const Duration(milliseconds: 150),
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
                color: AppColors.greyBackground,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(18.0))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: CartStack(expanded: widget.cartExpanded),
              ),
            ),
          );
        },
      ),
    );
  }
}
