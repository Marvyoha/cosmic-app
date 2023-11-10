import 'package:cosmic/constants/font_styles.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const AuthButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.69, -0.72),
            end: Alignment(0.69, 0.72),
            colors: [Color(0xFF00E5E5), Color(0xFF72A4F1), Color(0xFFE860FF)],
          ),
          borderRadius: BorderRadius.circular(44),
        ),
        child: Center(
          child: Text(text, style: FontStyles.headerMedium),
        ),
      ),
    );
  }
}
