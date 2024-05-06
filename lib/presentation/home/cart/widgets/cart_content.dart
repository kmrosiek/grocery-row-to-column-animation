import 'package:flutter/material.dart';
import 'package:grocery/presentation/home/cart/expanded_cart.dart';
import 'package:grocery/presentation/home/cart/minimized_cart.dart';

class CartContent extends StatefulWidget {
  const CartContent({super.key, required this.expanded});
  final bool expanded;

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1600),
        reverseDuration: const Duration(milliseconds: 400));
    Animation<double> curve = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  void _runExpandCheck() {
    if (widget.expanded) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(CartContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  Widget build(BuildContext context) {
    return true
        ? SizeTransition(
            //axisAlignment: 1.0,
            sizeFactor: animation,
            child: ExpandedCart(expanded: widget.expanded))
        : Column(
            children: [
              const MinimizedCart(),
              Expanded(
                child: SizeTransition(
                    //axisAlignment: 1.0,
                    sizeFactor: animation,
                    child: ExpandedCart(expanded: widget.expanded)),
              ),
              if (true)
                ElevatedButton(
                    onPressed: () {
                      if (expandController.isCompleted) {
                        expandController.reverse();
                      } else {
                        expandController.forward();
                      }
                    },
                    child: const Text('')),
            ],
          );
  }
}
