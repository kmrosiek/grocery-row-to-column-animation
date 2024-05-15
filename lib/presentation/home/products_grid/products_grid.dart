import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grocery/application/products_cubit/products_cubit.dart';
import 'package:grocery/presentation/home/products_grid/product_card/product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.products.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('No Products could be listed',
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () =>
                          context.read<ProductsCubit>().fetchProducts(),
                      child: const Row(
                        children: [
                          SizedBox(width: 12),
                          FaIcon(FontAwesomeIcons.rotateRight),
                          SizedBox(width: 12),
                          Text('Retry'),
                        ],
                      )),
                ),
              ],
            );
          }
          return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.8,
              children: state.products
                  .map((product) => ProductCard(product: product))
                  .toList());
        },
      ),
    );
  }
}
