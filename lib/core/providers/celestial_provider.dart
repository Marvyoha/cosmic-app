// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import '../../data/celestial_bodies_info.dart';

// class CelestialBodiesProvider with ChangeNotifier {
//   final Box _mybox = Hive.box('myBox');

//   final List<Map<dynamic, dynamic>> _celestialBodies = [
//     sun,
//     mercury,
//     venus,
//     earth,
//     mars,
//     jupiter,
//     saturn,
//     uranus,
//     neptune,
//     pluto,
//   ];

//   List<Map<dynamic, dynamic>>? get celestialBodies => _celestialBodies;

//   void addFavourites(index) {
//     _celestialBodies[index]['isFavorited'] = true;
//     _mybox.put('CelestialBodies', _celestialBodies);
//     notifyListeners();
//   }

//   void removeFavourites(index) {
//     _celestialBodies[index]['isFavorited'] = false;
//     _mybox.put('CelestialBodies', _celestialBodies);
//     notifyListeners();
//   }
// }
