import 'package:flutter/material.dart';

import '../global_variables.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;
  const MainScaffold({super.key, required this.child});

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
          child: child,
        ),
      ),
    );
  }
}
