import 'package:flutter/material.dart';
import 'package:grocery/presentation/common/app_theme.dart';
import 'package:grocery/presentation/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery app',
      theme: AppTheme.bright(context),
      home: const Home(),
    );
  }
}
