import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/celestial_bodies_info.dart';

class CelestialBodiesProvider with ChangeNotifier {
  List<Map<dynamic, dynamic>> _favourites = [];
  final List<Map<dynamic, dynamic>> _celestialBodies = allBodies;
  final _mybox = Hive.box('myBox');


  List<Map<dynamic, dynamic>> get favourites => _favourites;
  List<Map<dynamic, dynamic>>? get celestialBodies => _celestialBodies;

  void addFavourites(index) {
    _favourites.add(_celestialBodies[index]);
    updateData();
    notifyListeners();
  }

  void removeFavourites(index) {
    _favourites.remove(_celestialBodies[index]);
    updateData();
    notifyListeners();
  }

  void updateData() {
    _mybox.put('CelestialBodies', _celestialBodies);
  }

  void loadData() {
    _favourites = _mybox.get('CelestialBodies');
  }
}
