import 'package:cosmic/constants/color_palette.dart';
import 'package:cosmic/constants/font_styles.dart';
import 'package:cosmic/constants/global_variables.dart';
import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/celestial_bodies_info.dart';

class PlanetShowcase extends StatelessWidget {
  final int index;

  const PlanetShowcase({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final infoProvider = context.watch<CelestialBodiesProvider>();
    List statsRepresents = [
      [
        'lib/assets/planet icons/mass icon.png',
        'Mass (10^24 kg)',
        infoProvider.celestialBodies[index]['mass'],
      ],
      [
        'lib/assets/planet icons/gravity icon.png',
        'Gravity(relative to earth)',
        infoProvider.celestialBodies[index]['gravity'],
      ],
      [
        'lib/assets/planet icons/day icon.png',
        'Length of day(hours)',
        infoProvider.celestialBodies[index]['lengthOfDay'],
      ],
      [
        'lib/assets/planet icons/planet diameter.png',
        'Total Diameter(km)',
        infoProvider.celestialBodies[index]['diameter']
      ],
      [
        'lib/assets/planet icons/no of moons icon.png',
        'Number of Moons',
        infoProvider.celestialBodies[index]['moons'],
      ],
      [
        'lib/assets/planet icons/distance from the sun.png',
        'Distance from the sun (10^6 km)',
        infoProvider.celestialBodies[index]['distanceFromSun'],
      ],
      [
        'lib/assets/planet icons/temp icon.png',
        'Av.Temparature(celcius)',
        infoProvider.celestialBodies[index]['avgTemperature']
      ],
    ];

    return MainScaffold(
      notMainPage: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // TOPBAR
            Padding(
              padding: GlobalVariables.normPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        border: Border.all(width: 2, color: Colors.black),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        maxRadius: 40,
                        minRadius: 30,
                        child: Icon(
                          Icons.chevron_left,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (infoProvider.celestialBodies[index]['isFavorited'] ==
                          true) {
                        infoProvider.removeFavourites(index);
                      } else {
                        infoProvider.addFavourites(index);
                      }
                    },
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        border: Border.all(width: 2, color: Colors.black),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        maxRadius: 40,
                        minRadius: 30,
                        child: Icon(
                          infoProvider.celestialBodies[index]['isFavorited']
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GlobalVariables.spaceSmall(context),
            // MAIN INFO
            CircleAvatar(
                radius: 90,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  infoProvider.celestialBodies[index]['image'],
                )),
            GlobalVariables.spaceSmall(context),

            Container(
              decoration: GlobalVariables.cardDecor,
              child: Column(
                children: [
                  GlobalVariables.spaceSmall(context),
                  Text(
                    infoProvider.celestialBodies[index]['name'],
                    style: FontStyles.headerLarge,
                  ),
                  GlobalVariables.spaceSmall(context),
                  GlobalVariables.spaceSmall(context),
                  // STATS GRIDVIEW
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 400,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: statsRepresents.length,
                      itemBuilder: (BuildContext context, int gridIndex) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                statsRepresents[gridIndex][0],
                                color: Colors.white,
                              ),
                            ),
                            GlobalVariables.spaceSmall(context),
                            Text(
                              statsRepresents[gridIndex][1],
                              textAlign: TextAlign.center,
                              style: FontStyles.bodyMedium.copyWith(
                                fontWeight: FontWeight.normal,
                                color: AppColors.active,
                              ),
                            ),
                            GlobalVariables.spaceSmall(context),
                            Text(
                              statsRepresents[gridIndex][2],
                              style: FontStyles.headerSmall.copyWith(
                                color: AppColors.accent,
                                fontSize: 15.7,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  GlobalVariables.spaceSmall(context),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      infoProvider.celestialBodies[index]['longDescription'],
                      style: FontStyles.headerMedium.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 23),
                    ),
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
