import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/widgets/logo.dart';
import 'package:flutter/material.dart';

class CenterLogoAndBackAppbar extends StatelessWidget {
  const CenterLogoAndBackAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: MainLogo(height: 60, wedth: 60),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded, size: 28),
      ),
    );
  }
}

//////////////////////////////////////////////////
class CenterLogoAppbar extends StatelessWidget {
  const CenterLogoAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: MainLogo(height: 60, wedth: 60),
      centerTitle: true,
    );
  }
}

/////////////////////////////////////////////////
class CenterandLeadingLogoAppbar extends StatelessWidget {
  const CenterandLeadingLogoAppbar({super.key, required this.leading});

  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: MainLogo(height: 60, wedth: 60),
      centerTitle: true,
      leading: leading,
    );
  }
}

// MainLogo(height: 40, wedth: 40),

class CenterWidgetAppbar extends StatelessWidget {
  const CenterWidgetAppbar({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: title,
      centerTitle: true,
    );
  }
}



class CenterChildAndBackAppbar extends StatelessWidget {
  const CenterChildAndBackAppbar({super.key, required this.title, required this.leading});

  final Widget title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      title: title,
      leading: leading,
      centerTitle: true,
    );
  }
}