import 'package:flutter/material.dart';

import 'color_palette.dart';

class GlobalVariables {
  static String logo = 'lib/assets/Cosmic logo.png';
  static String background = 'lib/assets/Cosmic Background.png';
  static String googleLogo = 'lib/assets/google logo.png';
  static String homeIcon = 'lib/assets/home icon.png';
  static String favIcon = 'lib/assets/fav icon.png';
  static String moreIcon = 'lib/assets/more icon.png';
  static String profileIcon = 'lib/assets/profile icon.png';

  static double sizeHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double sizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static spaceLarge(BuildContext context, {bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(width: sizeWidth(context) * 0.1);
    }
    return SizedBox(height: sizeHeight(context) * 0.1);
  }

  static spaceMedium(BuildContext context, {bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(width: sizeWidth(context) * 0.05);
    }
    return SizedBox(height: sizeHeight(context) * 0.05);
  }

  static spaceSmall(BuildContext context, {bool isWidth = false}) {
    if (isWidth == true) {
      return SizedBox(width: sizeWidth(context) * 0.01);
    }
    return SizedBox(height: sizeHeight(context) * 0.01);
  }

  static BoxDecoration darkTranslusent = BoxDecoration(
    color: Colors.black.withOpacity(0.35),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(40),
      topRight: Radius.circular(40),
    ),
  );

  static BoxDecoration cardDecor = BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: AppColors.elevation.withOpacity(0.67));

  static EdgeInsets cardPadding = const EdgeInsets.all(30.0);

  static EdgeInsetsGeometry normPadding = const EdgeInsets.all(15);
}
