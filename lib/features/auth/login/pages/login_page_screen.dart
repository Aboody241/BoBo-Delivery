import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/core/consts/widgets/custom_appbar.dart';
import 'package:bobo/core/consts/widgets/custom_forms.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isvisable = true;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CenterLogoAndBackAppbar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Text(
              'Log in to your \naccount',
              style: AppTextStyle.poppinsHeading1.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(20),
            CustomTextfield(hintText: 'email address', suffix: null),
            Gap(15),
            CustomTextfield(
              hintText: 'password',
              suffix: IconButton(
                onPressed: () {
                  isvisable;
                },
                icon: Icon(Icons.remove_red_eye_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
