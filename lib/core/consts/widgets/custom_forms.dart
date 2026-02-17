import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.hintText, this.suffix,  this.isvisable});
  final String hintText;

  final IconButton? suffix;

  final bool? isvisable;


  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isvisable ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: AppColors.darkTypography400,
            width: 1.8, // usually 4 is quite thick for a text field
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: Colors.blueAccent, // color when focused
            width: 2,
          ),
        ),
        hintStyle: AppTextStyle.poppins14.copyWith(
          color: AppColors.darkGrey300,
        ),
        suffixIcon: suffix,
        
      ),
    );
  }
}
