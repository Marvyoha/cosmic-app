import 'package:cosmic/constants/color_palette.dart';
import 'package:cosmic/constants/font_styles.dart';
import 'package:cosmic/constants/global_variables.dart';
import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:cosmic/data/celestial_bodies_info.dart';
import 'package:cosmic/pages/main_screens/widgets/mainhub_appbar.dart';
import 'package:cosmic/pages/main_screens/widgets/planet_card.dart';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/planet_showcase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final infoProvider =
        Provider.of<CelestialBodiesProvider>(context, listen: true);
    return MainScaffold(
        child: SingleChildScrollView(
      child: Column(
        children: [
          MainHubAppBar(
            image: GlobalVariables.logo,
            isImage: true,
          ),
          // LIST OF PLANETS
          SizedBox(
            height: 100,
            child: Padding(
              padding: GlobalVariables.normPadding,
              child: ListView.builder(
                itemCount: infoProvider.celestialBodies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  int id = infoProvider.celestialBodies[index]['id'];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlanetShowcase(
                            index: id,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.elevation.withOpacity(0.5)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                  infoProvider.celestialBodies[id]['image']),
                            ),
                            GlobalVariables.spaceSmall(context, isWidth: true),
                            GlobalVariables.spaceSmall(context, isWidth: true),
                            Text(
                              infoProvider.celestialBodies[id]['name'],
                              style: FontStyles.headerSmall,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // RANDOM CELESTIAL BODY
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: PlanetCard(
                index: randomID,
                title: 'Random Celestial Body',
                planetName: randomCelestialBody['name'],
                planetImage: randomCelestialBody['image'],
                planetShortDescription:
                    randomCelestialBody['shortDescription']),
          ),
          Padding(
            padding: GlobalVariables.normPadding,
            child: Container(
              padding: GlobalVariables.cardPadding,
              decoration: GlobalVariables.cardDecor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Solar System',
                    style: FontStyles.cardHeader,
                  ),
                  GlobalVariables.spaceSmall(context),
                  ExpandableText(
                    solarSystemInfo,
                    style: FontStyles.headerSmall
                        .copyWith(fontWeight: FontWeight.normal),
                    maxLines: 10,
                    linkColor: AppColors.accent,
                    linkEllipsis: false,
                    expandText: 'Show more',
                    collapseText: 'Show less',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
