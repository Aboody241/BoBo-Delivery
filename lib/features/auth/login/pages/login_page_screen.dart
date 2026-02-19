import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/core/consts/widgets/custom_appbar.dart';
import 'package:bobo/core/consts/widgets/custom_forms.dart';
import 'package:bobo/core/consts/widgets/titled_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  final TextEditingController emailcon = TextEditingController();
  final TextEditingController passlcon = TextEditingController();
  bool isbuttoninabled = false;

  @override
  void initState() {
    super.initState();

    passlcon.addListener(() {
      setState(() {
        isbuttoninabled = passlcon.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    passlcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isvisable = true;

    final String email = 'email';
    final String pass = 'pass';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CenterLogoAndBackAppbar(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitledText(title: 'Log in to your \naccount'),
                      Gap(20),
                      Passwordfields(
                        controller: emailcon,
                        hintText: 'email address',
                      ),
                      Gap(15),
                      Passwordfields(
                        controller: passlcon,
                        hintText: 'password',
                        
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.forgetpassword,
                              );
                            },
                            child: Text(
                              'Forget Password',
                              style: AppTextStyle.poppins14.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      _LoginButton(
                        onPressed: isbuttoninabled ? () {} : null,
                        text: 'Log in',
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an account?'),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign up',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key, required this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return SizedBox(
      width: double.infinity, // Full width
      height: 55, // نفس الارتفاع اللي في الصورة
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0, // مفيش ظل
          backgroundColor: isDisabled
              ? AppColors.darkGrey400
              : AppColors.lightPrimary600, // الأخضر
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // Rounded قوي
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
