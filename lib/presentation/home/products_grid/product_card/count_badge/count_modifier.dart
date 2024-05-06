import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/app_colors.dart';

class CountModifier extends StatelessWidget {
  const CountModifier({super.key, required this.icon, required this.onPressed});
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: AppColors.primaryColor.withAlpha(0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: icon,
        ),
      ),
    );
  }
}
