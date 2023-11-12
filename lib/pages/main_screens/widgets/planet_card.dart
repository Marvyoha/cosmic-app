import 'package:cosmic/constants/color_palette.dart';
import 'package:cosmic/constants/font_styles.dart';
import 'package:cosmic/constants/global_variables.dart';
import 'package:cosmic/pages/main_screens/widgets/planet_showcase.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/celestial_provider.dart';

class PlanetCard extends StatelessWidget {
  String? title;
  final String planetName;
  final String planetImage;
  final String planetShortDescription;
  final int index;
  final bool isfavourPage;

  PlanetCard(
      {super.key,
      this.title,
      required this.planetName,
      required this.planetShortDescription,
      required this.planetImage,
      required this.index,
      this.isfavourPage = false});

  @override
  Widget build(BuildContext context) {
    final infoProvider =
        Provider.of<CelestialBodiesProvider>(context, listen: true);
    return Container(
      decoration: GlobalVariables.cardDecor,
      child: Padding(
        padding: GlobalVariables.cardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isfavourPage
                ? Container()
                : Text(
                    title!,
                    style: FontStyles.cardHeader,
                  ),
            GlobalVariables.spaceSmall(context),
            GlobalVariables.spaceSmall(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 35,
                  child: Image.asset(planetImage),
                ),
                GlobalVariables.spaceSmall(context, isWidth: true),
                GlobalVariables.spaceSmall(context, isWidth: true),
                GlobalVariables.spaceSmall(context, isWidth: true),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isfavourPage
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                planetName,
                                style: FontStyles.cardHeader
                                    .copyWith(color: AppColors.accent),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (!infoProvider.favourites.contains(
                                        infoProvider.celestialBodies![index])) {
                                      context
                                          .read<CelestialBodiesProvider>()
                                          .addFavourites(index);
                                    } else {
                                      context
                                          .read<CelestialBodiesProvider>()
                                          .removeFavourites(index);
                                    }
                                  },
                                  icon: Icon(
                                    infoProvider.favourites.contains(
                                            infoProvider
                                                .celestialBodies![index])
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                  ))
                            ],
                          )
                        : Text(
                            planetName,
                            style: FontStyles.cardHeader
                                .copyWith(color: AppColors.accent),
                          ),
                    GlobalVariables.spaceSmall(context),
                    SizedBox(
                      width: 200,
                      child: AutoSizeText(
                        planetShortDescription,
                        style: FontStyles.headerSmall
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                )
              ],
            ),
            GlobalVariables.spaceSmall(context),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlanetShowcase(
                      index: index,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        'Details',
                        style: FontStyles.bodyMedium
                            .copyWith(color: AppColors.active),
                      ),
                      Icon(
                        Icons.arrow_right_alt_rounded,
                        color: AppColors.accent,
                        size: 30,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
