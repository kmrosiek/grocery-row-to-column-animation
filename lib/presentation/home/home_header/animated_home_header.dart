import 'package:flutter/material.dart';
import 'package:grocery/presentation/home/home_header/home_header.dart';

class AnimatedHomeHeader extends StatefulWidget {
  const AnimatedHomeHeader({super.key, required this.hideHeader});
  final bool hideHeader;

  @override
  State<AnimatedHomeHeader> createState() => _AnimatedHomeHeaderState();
}

class _AnimatedHomeHeaderState extends State<AnimatedHomeHeader>
    with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(AnimatedHomeHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (widget.hideHeader) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: -1.0,
      sizeFactor: _animation,
      child: const HomeHeader(),
    );
  }
}
