import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/presentation/common/app_colors.dart';
import 'package:grocery/presentation/common/dim.dart';

class AppTheme {
  static bright(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(Dim.padding * 0.75),
            shape: const StadiumBorder(),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
          ),
        ),
      );
}
