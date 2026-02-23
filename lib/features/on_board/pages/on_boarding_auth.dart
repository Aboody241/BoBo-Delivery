import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/core/consts/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class OnBoardingAuth extends StatelessWidget {
  const OnBoardingAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> icons = [
      FontAwesomeIcons.google,
      FontAwesomeIcons.apple,
      Icons.email,
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/consts/Logo.png', height: 50),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/on_board/onb4.png", height: 300),

            const SizedBox(height: 20),

            Text(
              "Join to get the delicious cuisines!",
              textAlign: TextAlign.center,
              style: AppTextStyle.poppinsHeading1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.mainNav);
              },
              text: "Continue as Guest",
              gradient: LinearGradient(
                colors: [AppColors.lightPrimary600, AppColors.darkPrimary500],
              ),
              textColor: AppColors.white,
            ),
            Gap(10),

            Text(
              "OR",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGrey300,
              ),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AuthButtons(icon: icons[0], onTap: () {}),
                AuthButtons(icon: icons[1], onTap: () {}),
                AuthButtons(
                  icon: icons[2],
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.loginscreen);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 42),
        decoration: BoxDecoration(
          color: AppColors.lightPrimary100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Icon(icon, size: 24, color: AppColors.black)),
      ),
    );
  }
}
