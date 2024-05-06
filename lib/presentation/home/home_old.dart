/*import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/dim.dart';
import 'package:grocery/presentation/home/cart/cart.dart';
import 'package:grocery/presentation/home/products_grid/products_grid.dart';
import 'package:grocery/presentation/home/home_header/home_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool _cartExpanded = true;

  late final AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleCartExpanded() {
    setState(() => _cartExpanded = !_cartExpanded);
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceTopPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: deviceTopPadding),
          SizeTransition(
            axisAlignment: -1.0,
            sizeFactor: _animation,
            child: const HomeHeader(),
          ),
          const SizedBox(height: Dim.padding),
          Expanded(
              child: GestureDetector(
                  onTap: () => setState(() => _cartExpanded = false),
                  child: AbsorbPointer(
                      absorbing: _cartExpanded, child: const ProductsGrid()))),
          Cart(expanded: _cartExpanded, toggleCartExpanded: toggleCartExpanded),
        ],
      ),
    );
  }
}
*/