import 'package:flutter/material.dart';
import 'package:grocery/presentation/home/cart/widgets/product_circle.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: ProductCircle(),
      title: Text('Cabbage'),
      trailing: Text('\$20/kg x 1'),
    );
  }
}
