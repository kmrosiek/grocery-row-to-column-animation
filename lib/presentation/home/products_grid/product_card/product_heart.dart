import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:grocery/presentation/common/app_colors.dart';

class ProductHeart extends StatefulWidget {
  const ProductHeart(
      {super.key, required this.onPressed, required this.isLiked});
  final VoidCallback onPressed;
  final bool isLiked;

  @override
  State<ProductHeart> createState() => _ProductHeartState();
}

class _ProductHeartState extends State<ProductHeart>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool isL = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        _controller.forward().then((_) => _controller.reverse());
        setState(() {
          isL = !isL;
        });
      },
      child: Container(
        color: AppColors.greyBackground.withAlpha(0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          padding: const EdgeInsets.all(6.0),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            child: ScaleTransition(
              scale: Tween<double>(begin: 1.0, end: 1.5).animate(_controller),
              child: Icon(isL ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
