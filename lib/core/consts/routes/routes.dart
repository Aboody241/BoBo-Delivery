import 'package:bobo/core/components/not_found_screen.dart';
import 'package:bobo/core/consts/pages/verfiy_OPT_NewAccount.dart';
import 'package:bobo/features/auth/forgetpassword/pages/verfieOPTpage.dart';
import 'package:bobo/features/auth/login/pages/login_page_screen.dart';
import 'package:bobo/features/auth/reset_password/pages/reset_password_screen.dart';
import 'package:bobo/features/auth/signup/pages/create_account_screen.dart';

import 'package:bobo/features/home/pages/main_nav_screen.dart';
import 'package:bobo/features/on_board/pages/on_board_page.dart';
import 'package:bobo/features/on_board/pages/on_boarding_auth.dart';
import 'package:bobo/features/profile/pages/create_profile_screen.dart';
import 'package:bobo/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String onBoardingAuth = '/onBoardingAuth';
  static const String profile = '/profile';
  static const String loginscreen = '/loginscreen';
  static const String verfiyOTPScreen = '/verfiyOTP';
  static const String verfiyOTPScreenNewAccount = '/verfiyOTPNewAccount';
  static const String notfoundpage = '/notfoundpage';
  static const String resetpassword = '/resetpassword';
  static const String createAccount = '/createAccount';
  static const String createProfileScreen = '/createProfileScreen';
  static const String homePage = '/homepage';
  static const String mainNav = '/main';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case mainNav:
      case homePage:
        return MaterialPageRoute(builder: (_) => const MainNavScreen());

      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardPage());

      case onBoardingAuth:
        return MaterialPageRoute(builder: (_) => const OnBoardingAuth());
      case profile:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Profile Page"))),
        );
      case loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginPageScreen());
      case verfiyOTPScreen:
        return MaterialPageRoute(builder: (_) => const VerfiyOTPScreen());
      case notfoundpage:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
      case resetpassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccountScreen());
      case verfiyOTPScreenNewAccount:
        return MaterialPageRoute(
          builder: (_) => const VerfiyOTPNewAccountScreen(),
        );
      case createProfileScreen:
        return MaterialPageRoute(builder: (_) => const CreateProfileScreen());

      //==============================================================================
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
