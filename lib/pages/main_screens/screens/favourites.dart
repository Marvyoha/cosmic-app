import 'package:cosmic/constants/font_styles.dart';
import 'package:cosmic/constants/global_variables.dart';
import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:cosmic/data/celestial_bodies_info.dart';
import 'package:cosmic/pages/main_screens/widgets/favorite_planet_card.dart';
import 'package:cosmic/pages/main_screens/widgets/mainhub_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourites extends StatelessWidget {
  const Favourites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CelestialBodiesProvider>(
      builder: (context, infoProvider, child) {
        bool checkFavorites() {
          if (infoProvider.getFavorites().isEmpty) {
            return true;
          } else {
            return false;
          }
        }

        bool? noFavorite = checkFavorites();

        return MainScaffold(
          child: Column(children: [
            const MainHubAppBar(
              text: 'Favourites',
            ),
            GlobalVariables.spaceMedium(context),
            noFavorite
                ? Column(
                    children: [
                      SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset(
                            GlobalVariables.noFavorites,
                          )),
                      Text(
                        'Go and Explore,\nno items favorited',
                        textAlign: TextAlign.center,
                        style: FontStyles.headerMedium,
                      )
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: infoProvider.getFavorites().length,
                      itemBuilder: (context, index) {
                        int id = infoProvider.getFavorites()[index]['id'];

                        if (infoProvider.celestialBodies[id]['isFavorited'] ==
                            true) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FavoritePlanetCard(
                              planetName: infoProvider.celestialBodies[id]
                                  ['name'],
                              planetShortDescription: infoProvider
                                  .celestialBodies[id]['shortDescription'],
                              planetImage: infoProvider.celestialBodies[id]
                                  ['image'],
                              index: id,
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  )
          ]),
        );
      },
    );
  }
}
