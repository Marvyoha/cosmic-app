import 'package:flutter/material.dart';

import '../../../constants/font_styles.dart';

class CustomTextField extends StatefulWidget {
  final String? text;
  final TextEditingController? controller;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.text,
    this.obscureText = false,
    this.controller,
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: '${widget.text}:',
          hintStyle: FontStyles.hintText,
          contentPadding: const EdgeInsets.all(16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(44),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.3), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(44),
            borderSide: const BorderSide(color: Colors.white, width: 1.3),
          ),
        ),
      ),
    );
  }
}
