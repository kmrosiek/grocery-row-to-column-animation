import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/app_colors.dart';
import 'package:grocery/presentation/home/products_grid/product_card/count_badge/count_text.dart';
import 'package:grocery/presentation/home/products_grid/product_card/count_badge/opened_badge.dart';

class CountBadge extends StatefulWidget {
  const CountBadge({super.key});

  @override
  State<CountBadge> createState() => _CountBadgeState();
}

class _CountBadgeState extends State<CountBadge> {
  bool _isOpen = false;
  int _count = 0;
  late final RestartableTimer _timer =
      RestartableTimer(const Duration(milliseconds: 2500), () {
    setState(() => _isOpen = false);
  });

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        if (_count == 0) {
          _count++;
          _isOpen = true;
        } else {
          _isOpen = !_isOpen;
        }

        if (_isOpen) {
          _timer.reset();
        }
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOutCirc,
        width: _isOpen ? 130 : 30,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0)),
          color: AppColors.primaryColor,
        ),
        child: _isOpen
            ? _openedBadge()
            : CountText(text: _count == 0 ? '+' : _count.toString()),
      ),
    );
  }

  Widget _openedBadge() => OpenedBadge(
      count: _count.toString(),
      onRemove: () => setState(() {
            _count--;
            _timer.reset();
            if (_count == 0) {
              _isOpen = false;
              _timer.cancel();
            }
          }),
      onAdd: () => setState(() {
            _count++;
            _timer.reset();
          }));
}
