import 'package:bobo/features/auth/login/pages/login_page_screen.dart';
import 'package:bobo/features/on_board/pages/on_board_page.dart';
import 'package:bobo/features/on_board/pages/on_boarding_auth.dart';
import 'package:bobo/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String onBoardingAuth = '/onBoardingAuth';
  static const String profile = '/profile';
  static const String loginscreen = '/loginscreen';
  

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardPage(),
        );

      case onBoardingAuth:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingAuth(),
        );

      case profile:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Profile Page")),
          ),
        );

      case loginscreen:
        return MaterialPageRoute(
          builder: (_) => const LoginPageScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route غير موجود'),
            ),
          ),
        );
    }
  }
}
