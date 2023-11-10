import 'package:cosmic/constants/color_palette.dart';
import 'package:cosmic/constants/global_variables.dart';
import 'package:cosmic/core/providers/btm_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BtmNvBr extends StatelessWidget {
  const BtmNvBr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.35),
          borderRadius: const BorderRadius.all(
            Radius.circular(26),
          ),
        ),
        child: Consumer<NavBarProvider>(
            builder: (context, pageProvider, child) => Container(
                  padding: const EdgeInsets.all(12),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImgNavBarIcon(
                        image: GlobalVariables.homeIcon,
                        color: pageProvider.pageIndex == 0
                            ? AppColors.accent
                            : AppColors.active,
                        onTap: () {
                          pageProvider.pageIndex = 0;
                        },
                      ),
                      ImgNavBarIcon(
                        image: GlobalVariables.favIcon,
                        color: pageProvider.pageIndex == 1
                            ? AppColors.accent
                            : AppColors.active,
                        onTap: () {
                          pageProvider.pageIndex = 1;
                        },
                      ),
                      ImgNavBarIcon(
                        image: GlobalVariables.moreIcon,
                        color: pageProvider.pageIndex == 2
                            ? AppColors.accent
                            : AppColors.active,
                        onTap: () {
                          pageProvider.pageIndex = 2;
                        },
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}

class ImgNavBarIcon extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final Color color;

  const ImgNavBarIcon({
    super.key,
    required this.onTap,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Image.asset(
          image,
          color: color,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
