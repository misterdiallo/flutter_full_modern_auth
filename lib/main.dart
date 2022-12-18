import 'package:flutter/material.dart';
import 'package:flutter_full_modern_auth/constant/app_colors.dart';
import 'package:flutter_full_modern_auth/ui/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Flutter Modern Auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
        primarySwatch: Colors.amber,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
        primarySwatch: Colors.amber,
      ),
      themeMode: ThemeMode.light,
      home: LoginPage(),
    );
  }
}
