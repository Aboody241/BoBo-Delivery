import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/core/consts/widgets/custom_appbar.dart';
import 'package:bobo/core/consts/widgets/custom_buttons.dart';
import 'package:bobo/core/consts/widgets/custom_forms.dart';
import 'package:bobo/core/consts/widgets/titled_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();

  bool isvalid = false;

  void validator() {
    setState(() {
      isvalid =
          passwrodController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwrodController.text.length > 5;
    });
  }

  @override
  void initState() {
    emailController.addListener(validator);
    passwrodController.addListener(validator);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwrodController.dispose();
    super.dispose();
  }

  bool isagreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CenterLogoAndBackAppbar(),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitledText(title: 'Create a new \naccount'),
            Gap(25),

            BasicTextField(
              controller: emailController,
              hintText: 'email address',
            ),
            Gap(20),
            Passwordfields(
              controller: passwrodController,
              hintText: 'password',
            ),
            Gap(8),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isagreed = !isagreed;
                    });
                  },
                  icon: isagreed
                      ? Icon(
                          Icons.check_box,
                          color: AppColors.darkGradientLight,
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          color: AppColors.darkGradientLight,
                        ),
                ),

                Text(
                  'I agree to terms & conditions',
                  style: AppTextStyle.poppins16.copyWith(
                    color: AppColors.darkGrey300,
                  ),
                ),
              ],
            ),
            Spacer(),
            EnabledButton(
              onPressed: isvalid ? () {} : null,
              text: 'Create Account',
              hei: 60,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don’t have an account?'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
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
    );
  }
}
