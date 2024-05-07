import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  final dragController = DraggableScrollableController();

  double get _getMinScrollHeight => _minScrollHeight ?? _defaultMinScrollHeight;
  double get _getMaxScrollHeight => _maxScrollHeight ?? _defaultMaxScrollHeight;

  void animateDragOnTap(double height) {
    dragController.animateTo(
      height,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  /*void toggleDragSheet({required double minScrollHeight}) {
    if (dragController.size == maxScrollHeight) {
      animateDragOnTap(minScrollHeight);
    } else {
      animateDragOnTap(maxScrollHeight);
    }
  }*/

  @override
  void initState() {
    super.initState();
    /*dragController.addListener(() {
      final newSize = dragController.size;
      if (newSize <= 0.15 + 0.05) {
        //setState(() => _cartExpanded = false);
      } else if (newSize >= maxScrollHeight - 0.05) {
        //setState(() => _cartExpanded = true);
      }
    });*/
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenHeight = MediaQuery.of(context).size.height;
    _minScrollHeight ??= 100 / screenHeight;
    const double baseStackHeight = 80;
    const int noOfProducts = 5;
    const double verticalItemsSpacing = 70.0;
    const double stackSize =
        baseStackHeight + noOfProducts * (verticalItemsSpacing) + 00;
    _maxScrollHeight ??= (80 + stackSize) / screenHeight;

    dragController.addListener(() {
      final newSize = dragController.size;
      if (newSize <= _getMinScrollHeight + 0.01) {
        widget.updateExpanded(false);
      } else if (newSize >= _getMaxScrollHeight - 0.01) {
        widget.updateExpanded(true);
      }
    });
  }

  @override
  void dispose() {
    dragController.dispose();
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
    return DraggableScrollableSheet(
      controller: dragController,
      initialChildSize: _getMinScrollHeight,
      minChildSize: _getMinScrollHeight,
      maxChildSize: _getMaxScrollHeight,
      snap: true,
      snapAnimationDuration: const Duration(milliseconds: 150),
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColors.greyBackground,
              borderRadius: BorderRadius.vertical(top: Radius.circular(18.0))),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: CartStack(expanded: widget.cartExpanded),
            ),
          ),
        );
      },
    );
  }
}
