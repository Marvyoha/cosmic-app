import 'package:cosmic/core/providers/btm_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/btm_nav_bar.dart';
import 'favourites.dart';
import 'homepage.dart';
import 'morepage.dart';

class MainHub extends StatefulWidget {
  const MainHub({super.key});

  @override
  State<MainHub> createState() => _MainHubState();
}

class _MainHubState extends State<MainHub> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = const [HomePage(), Favourites(), MorePage()];

    return Consumer<NavBarProvider>(
      builder: (context, pageProvider, child) => Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.passthrough,
          children: [pageList[pageProvider.pageIndex], const BtmNvBr()],
        ),
      ),
    );
  }
}
