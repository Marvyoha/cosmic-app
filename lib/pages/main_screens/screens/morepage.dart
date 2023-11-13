import 'package:auto_size_text/auto_size_text.dart';
import 'package:cosmic/constants/font_styles.dart';
import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:cosmic/data/celestial_bodies_info.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: GlobalVariables.normPadding,
          child: Container(
            padding: GlobalVariables.cardPadding,
            decoration: GlobalVariables.cardDecor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'ABOUT THE APP',
                    style: FontStyles.cardHeader,
                  ),
                ),
                GlobalVariables.spaceSmall(context),
                GlobalVariables.spaceSmall(context),
                GlobalVariables.spaceSmall(context),
                AutoSizeText(
                  aboutTheApp,
                  style: FontStyles.headerMedium.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
