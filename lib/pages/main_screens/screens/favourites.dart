import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      child: Center(child: Text('favourites')),
    );
  }
}
