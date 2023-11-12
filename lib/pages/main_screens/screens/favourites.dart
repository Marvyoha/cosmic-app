import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:cosmic/core/providers/celestial_provider.dart';
import 'package:cosmic/pages/main_screens/widgets/mainhub_appbar.dart';
import 'package:cosmic/pages/main_screens/widgets/planet_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    var infoProvider = Provider.of<CelestialBodiesProvider>(context);
    return MainScaffold(
      child: Column(
        children: [
          const MainHubAppBar(
            text: 'Favourites',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: infoProvider.favourites.length,
              itemBuilder: (BuildContext context, int index) {
                return PlanetCard(
                    isfavourPage: true,
                    planetName: infoProvider.favourites[index]['name'],
                    planetShortDescription: infoProvider.favourites[index]
                        ['shortDescription'],
                    planetImage: infoProvider.favourites[index]['image'],
                    index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
