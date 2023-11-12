import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/planet_card.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Map<String, dynamic>> favored = [];
  late int ogIndex;
  @override
  void initState() {
    super.initState();

    Box mybox = Hive.box('myBox');
    List<Map<String, dynamic>> bodies = mybox.get('CelestialBodies');

    for (var celestialBody in bodies) {
      if (celestialBody['isFavorited'] == true) {
        // Add to favored list as a Map
        favored.add({
          'name': celestialBody['name'],
          'shortDescription': celestialBody['shortDescription'],
          'image': celestialBody['image'],
        });
      }
    }

    int getIndexFromCelestialBodies() {
      for (var i = 0; i < favored.length; i++) {
        var favoredName = favored[i]['name'];
        for (var j = 0; j < bodies.length; j++) {
          if (bodies[j]['name'] == favoredName) {
            return ogIndex = j;
          }
        }
      }
      return -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favored.length,
      itemBuilder: (BuildContext context, int index) {
        // Access Map keys
        return PlanetCard(
          index: ogIndex,
          planetName: favored[index]['name'],
          planetShortDescription: favored[index]['shortDescription'],
          planetImage: favored[index]['image'],
        );
      },
    );
  }
}
