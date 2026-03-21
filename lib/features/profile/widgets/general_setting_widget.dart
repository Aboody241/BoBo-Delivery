import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bobo/core/consts/routes/routes.dart';
import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/features/profile/data/general_settings_class.dart';
import 'package:bobo/services/firebase/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GeneralSettingWidget extends StatefulWidget {
  const GeneralSettingWidget({super.key});

  @override
  State<GeneralSettingWidget> createState() => _GeneralSettingWidgetState();
}

class _GeneralSettingWidgetState extends State<GeneralSettingWidget> {
  late List<GeneralSettingsClass> generalSettings;

  @override
  void initState() {
    super.initState();
    generalSettings = [
      GeneralSettingsClass(icon: Icons.person, title: 'My Account'),
      GeneralSettingsClass(
        icon: Icons.list_outlined,
        title: 'My Orders',
        navigation: () {
          Navigator.of(
            context,
            rootNavigator: true,
          ).pushNamed(AppRoutes.myOrdersScreen);
        },
      ),
      GeneralSettingsClass(icon: Icons.payment_rounded, title: 'Payments'),
      GeneralSettingsClass(icon: Icons.place_outlined, title: 'Addresses'),
      GeneralSettingsClass(icon: Icons.auto_awesome, title: 'Subscription'),
      GeneralSettingsClass(icon: Icons.settings, title: 'Settings'),
      GeneralSettingsClass(
        icon: Icons.logout_rounded,
        title: 'Logout',
        navigation: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            title: 'Logout',
            desc: 'Are you sure you want to logout?',
            btnCancelText: 'Cancel',
            btnOkText: 'Logout',
            btnCancelOnPress: () {}, // ✅ فاضية كده
            btnOkOnPress: () async {
              await AuthService().logout(); // ✅ await
              Navigator.of(
                context,
                rootNavigator: true,
              ).pushReplacementNamed(AppRoutes.onBoardingAuth);
            },
          ).show();
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: generalSettings.length,
      itemBuilder: (context, index) {
        final setting = generalSettings[index];
        return GestureDetector(
          onTap: setting.navigation,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 243, 245, 241),
            ),
            child: Row(
              children: [
                Icon(setting.icon, color: AppColors.darkGrey200, size: 28),
                const Gap(20),
                Text(
                  setting.title,
                  style: AppTextStyle.poppins18.copyWith(
                    color: AppColors.darkGrey200,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.darkGrey400,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
