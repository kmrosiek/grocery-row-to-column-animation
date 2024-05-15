import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/application/order_cubit/order_cubit.dart';
import 'package:grocery/presentation/common/dim.dart';
import 'package:grocery/presentation/home/cart/draggable_cart_sheet.dart';
import 'package:grocery/presentation/home/home_header/animated_home_header.dart';
import 'package:grocery/presentation/home/products_grid/products_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool _cartExpanded = false;

  @override
  Widget build(BuildContext context) {
    final deviceTopPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
        floatingActionButton: AnimatedScale(
          duration: const Duration(milliseconds: 150),
          alignment: Alignment.bottomCenter,
          scale: _cartExpanded ? 1.0 : 0.0,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: Dim.padding),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Checkout'))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: BlocProvider(
          create: (context) => OrderCubit(),
          child: Stack(children: [
            Column(children: [
              SizedBox(height: deviceTopPadding),
              AnimatedHomeHeader(hideHeader: _cartExpanded),
              const SizedBox(height: 12.0),
              Expanded(
                  child: GestureDetector(
                      onTap: _cartExpanded
                          ? () => setState(() => _cartExpanded = false)
                          : null,
                      child: AbsorbPointer(
                          absorbing: _cartExpanded,
                          child: const ProductsGrid()))),
              const SizedBox(height: 100),
            ]),
            GestureDetector(
                onTap: _cartExpanded
                    ? null
                    : () => setState(() => _cartExpanded = true),
                child: DraggableCartSheet(
                  cartExpanded: _cartExpanded,
                  updateExpanded: (bool expanded) {
                    setState(() => _cartExpanded = expanded);
                  },
                ))
          ]),
        ));
  }
}
