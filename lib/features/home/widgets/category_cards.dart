import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:flutter/material.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.index,
    required this.categoryName,
    this.isSelected = false,
  });

  final int index;
  final String categoryName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // fixed width for horizontal scroll
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isSelected? Color(0xffECF1E8) : AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 219, 220, 218)
        )
      ),
      child: Center(
        child: Text(
          categoryName,
          style:  AppTextStyle.poppins16.copyWith(
            color: isSelected? AppColors.black  : AppColors.darkGrey200 ,
            fontWeight: isSelected? FontWeight.bold : null
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
