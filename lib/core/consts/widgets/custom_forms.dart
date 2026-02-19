import 'package:bobo/core/consts/theme/colors.dart';
import 'package:bobo/core/consts/theme/fonts.dart';
import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField({
    super.key,
    required this.hintText,
    this.suffix,
    this.isvisable,
    this.onchange,
    this.controller,
  });
  final String hintText;

  final IconButton? suffix;

  final bool? isvisable;
  final Function(String)? onchange;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onchange,
      obscureText: isvisable ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 219, 219, 219),
            width: 1.3, // usually 4 is quite thick for a text field
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: AppColors.darkGradientDark, // color when focused
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

class Passwordfields extends StatefulWidget {
  const Passwordfields({super.key, required this.hintText, this.controller});
  final String hintText;

  final TextEditingController? controller;

  @override
  State<Passwordfields> createState() => _PasswordfieldsState();
}

class _PasswordfieldsState extends State<Passwordfields> {
  bool isvisable = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isvisable,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 219, 219, 219),
            width: 1.3, // usually 4 is quite thick for a text field
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            color: AppColors.darkGradientDark, // color when focused
            width: 2,
          ),
        ),
        hintStyle: AppTextStyle.poppins14.copyWith(
          color: AppColors.darkGrey300,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isvisable = !isvisable;
            });
          },
          icon: isvisable
              ? Icon(Icons.visibility_off_rounded)
              : Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}
