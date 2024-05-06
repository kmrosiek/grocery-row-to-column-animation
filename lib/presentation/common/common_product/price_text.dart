import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/app_colors.dart';

class PriceText extends StatelessWidget {
  const PriceText({super.key, required this.amount});
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "\$",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600, color: AppColors.primaryColor),
        children: [
          TextSpan(
            text: amount,
            style: const TextStyle(color: Colors.black),
          ),
          const TextSpan(
            text: "/kg",
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
