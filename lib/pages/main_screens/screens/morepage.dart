import 'package:cosmic/constants/widgets/main_scaffold.dart.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return const MainScaffold(
      child: Center(child: Text('More Page')),
    );
  }
}
