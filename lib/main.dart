import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/application/products_cubit/products_cubit.dart';
import 'package:grocery/presentation/common/app_theme.dart';
import 'package:grocery/presentation/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ProductsCubit _productsCubit = ProductsCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.bright(context),
      home: BlocProvider(
        create: (context) =>
            _productsCubit..fetchProducts(), // replace with GetIt.
        child: const Home(),
      ),
    );
  }
}
