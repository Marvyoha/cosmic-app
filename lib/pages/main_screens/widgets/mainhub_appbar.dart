import 'package:cosmic/constants/font_styles.dart';
import 'package:cosmic/constants/global_variables.dart';
import 'package:flutter/material.dart';

class MainHubAppBar extends StatelessWidget {
  final String? text;
  final String? image;
  final bool isImage;
  const MainHubAppBar({Key? key, this.text, this.image, this.isImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          borderRadius: const BorderRadius.all(
            Radius.circular(26),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 26,
            ),
            GlobalVariables.spaceMedium(context, isWidth: true),
            isImage
                ? SizedBox(
                    width: 180,
                    child: Image.asset(
                      image!,
                    ),
                  )
                : Text(
                    text!,
                    style: FontStyles.headerLarge,
                  ),
            GlobalVariables.spaceMedium(context, isWidth: true),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'profilePage');
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30,
                child: Container(
                  width: 53,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(GlobalVariables.profileIcon,
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ],
        ));
  }
}
