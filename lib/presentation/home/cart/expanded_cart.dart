import 'package:flutter/material.dart';
import 'package:grocery/presentation/home/cart/widgets/cart_list_item.dart';

class ExpandedCart extends StatelessWidget {
  const ExpandedCart({super.key, required this.expanded});
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final deviceBottomPadding = MediaQuery.of(context).padding.bottom;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (expanded)
          Expanded(
              child: ListView(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [CartListItem()])),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Checkout'))),
        SizedBox(height: deviceBottomPadding),
      ],
    );
  }
}
