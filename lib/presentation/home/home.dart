import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/dim.dart';
import 'package:grocery/presentation/home/products_grid/products_grid.dart';
import 'package:grocery/presentation/home/home_header/home_header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              HomeHeader(),
              SizedBox(height: Dim.padding),
              Expanded(child: ProductsGrid()),
            ],
          ),
        ),
      ),
    );
  }
}
