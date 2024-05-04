import 'package:flutter/material.dart';

class CountText extends StatelessWidget {
  const CountText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center);
  }
}
