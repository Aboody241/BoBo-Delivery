import 'package:bobo/consts/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 100,
            right: 100,
            top: 300,
            child: Image.asset(
              "assets/consts/Logo.png",
              width: 120,
              height: 120,
            ),
          ),
          Image.asset(
            'assets/consts/splash_background.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
