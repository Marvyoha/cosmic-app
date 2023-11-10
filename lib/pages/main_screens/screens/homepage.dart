import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:cosmic/pages/main_screens/widgets/mainhub_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/serviceproviders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final servicesProvider =
        Provider.of<ServicesProvider>(context, listen: true);
    return MainScaffold(
        child: Column(
      children: [MainHubAppBar(text: 'Solar System')],
    ));
  }
}
