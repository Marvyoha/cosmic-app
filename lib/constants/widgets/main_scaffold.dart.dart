import 'package:flutter/material.dart';

import '../global_variables.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;
  final bool notMainPage;
  const MainScaffold(
      {super.key, required this.child, this.notMainPage = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: GlobalVariables.sizeHeight(context),
          width: GlobalVariables.sizeWidth(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(GlobalVariables.background),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
              child: Padding(
            padding: notMainPage
                ? const EdgeInsets.only(bottom: 0)
                : const EdgeInsets.only(bottom: 70),
            child: child,
          )),
        ),
      ),
    );
  }
}
