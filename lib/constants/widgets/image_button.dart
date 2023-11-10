import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  const ImageButton({super.key, this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
