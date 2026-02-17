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
        icon: Icon(Icons.arrow_back_ios_new_rounded, size: 28,),
      ),
    );
  }
}

// MainLogo(height: 40, wedth: 40),
