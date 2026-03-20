import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/features/profile/data/general_settings_class.dart';
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
          // Navigator.push(context, AppRoutes.myOrdersScreen);
        },
      ),
      GeneralSettingsClass(icon: Icons.payment_rounded, title: 'Payments'),
      GeneralSettingsClass(icon: Icons.place_outlined, title: 'Addresses'),
      GeneralSettingsClass(icon: Icons.auto_awesome, title: 'Subscription'),
      GeneralSettingsClass(icon: Icons.settings, title: 'Settings'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: generalSettings.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromARGB(255, 243, 245, 241),
          ),
          child: Row(
            children: [
              Icon(
                generalSettings[index].icon,
                color: AppColors.darkGrey200,
                size: 28,
              ),
              Gap(20),
              Text(
                generalSettings[index].title,
                style: AppTextStyle.poppins18.copyWith(
                  color: AppColors.darkGrey200,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.darkGrey400,
              ),
            ],
          ),
        );
      },
    );
  }
}
