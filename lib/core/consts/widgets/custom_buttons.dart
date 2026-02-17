import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.gradient,
    this.textColor = Colors.white,
  });

  final VoidCallback onPressed;
  final String text;
  final LinearGradient gradient;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            backgroundColor: Colors.transparent, // مهم جدًا
            shadowColor: Colors.transparent,     // يشيل الظل
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor , fontSize: 18,fontWeight: FontWeight.w600 , fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }
}
