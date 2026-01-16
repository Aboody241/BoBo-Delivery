import 'package:bobo/consts/theme/colors.dart';
import 'package:bobo/consts/theme/fonts.dart';
import 'package:flutter/material.dart';

class OnBoardingAuth extends StatelessWidget {
  const OnBoardingAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
      ),
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 5, child: Image.asset("assets/on_board/onb4.png")),
          const SizedBox(height: 24),
          Text(
            "",
            textAlign: TextAlign.center,
            style: AppTextStyle.poppinsHeading1.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text("",
            textAlign: TextAlign.center,
            style: AppTextStyle.poppins20.copyWith(
              color: AppColors.lightTypography300,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    )
    );
  }
}