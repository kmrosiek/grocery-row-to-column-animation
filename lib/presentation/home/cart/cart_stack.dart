import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/dim.dart';
import 'package:grocery/presentation/home/cart/widgets/cart_title.dart';
import 'package:grocery/presentation/home/cart/widgets/product_circle.dart';
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
  static const _startingTopPosition = 40.0;
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

  static const int numberOfProduts = 5;
  static const double horizontalItemsSpacing = 60.0;
  static const double verticalItemsSpacing = 70.0;
  static const int singleItemAnimationDelay = 100;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double baseStackHeight = 80;
    const double stackSize =
        baseStackHeight + numberOfProduts * (verticalItemsSpacing);
    return Container(
      width: screenWidth,
      height: stackSize,
      padding: const EdgeInsets.all(Dim.padding),
      child: Stack(
        children: [
          const Positioned(top: 10, child: CartTitle()),
          ...List.generate(numberOfProduts, (index) => index).map((int index) {
            return AnimatedPositioned(
              duration: Duration(
                  milliseconds: 300 + index * singleItemAnimationDelay),
              curve: Curves.fastOutSlowIn,
              left: _leftPosition +
                  (_isItRow ? index * horizontalItemsSpacing : 0.0),
              top: _topPosition +
                  (!_isItRow ? index * verticalItemsSpacing : 0.0),
              child: Visibility(
                visible: !(_isItRow && index > 3),
                child: Row(
                  children: [
                    const ProductCircle(),
                    if (!_isItRow)
                      FadeTransition(
                        opacity: _fadeInAnimation,
                        child: SizedBox(
                          width: screenWidth - 100,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 12),
                              const Flexible(
                                fit: FlexFit.tight,
                                child: Text('Cabbage', maxLines: 2),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('\$20/kg x $index'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
          const Positioned(
              right: 0, child: ProductsCount(count: numberOfProduts)),
        ],
      ),
    );
  }
}
