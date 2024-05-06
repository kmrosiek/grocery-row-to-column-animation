import 'package:flutter/material.dart';
import 'package:grocery/presentation/home/products_grid/product_card/count_badge/count_modifier.dart';
import 'package:grocery/presentation/home/products_grid/product_card/count_badge/count_text.dart';

class OpenedBadge extends StatelessWidget {
  const OpenedBadge(
      {super.key,
      required this.onRemove,
      required this.onAdd,
      required this.count});
  final VoidCallback onRemove;
  final VoidCallback onAdd;
  final String count;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 10),
          CountModifier(
            icon: const Icon(Icons.remove),
            onPressed: onRemove,
          ),
          const SizedBox(width: 2),
          CountText(text: count),
          const SizedBox(width: 2),
          CountModifier(icon: const Icon(Icons.add), onPressed: onAdd),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
