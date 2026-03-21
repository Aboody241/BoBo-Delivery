import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:bobo/core/consts/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FavorateScreen extends StatefulWidget {
  const FavorateScreen({super.key});

  @override
  State<FavorateScreen> createState() => _FavorateScreenState();
}

class _FavorateScreenState extends State<FavorateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CenterWidgetAppbar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/like_icon.svg',
                width: 40,
                height: 40,
              ),
              Text('Favorites', style: AppTextStyle.poppins22Bold),
            ],
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(12),
            ),

            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                  child: Image.asset(
                    'assets/products/o_pizza.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),
                    Text(
                      'Pepperoni Cheese Pizza',
                      style: AppTextStyle.poppins16.copyWith(
                        color: AppColors.darkGrey300,
                      ),
                    ),
                    const Gap(20),
                    Text(
                      '\$10.00',
                      style: AppTextStyle.poppins18.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
