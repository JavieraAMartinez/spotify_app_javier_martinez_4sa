import 'package:flutter/material.dart';
import 'package:spotify_app_javier_martinez_4sa/core/configs/theme/app_theme.dart';
import 'package:spotify_app_javier_martinez_4sa/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
