import 'package:cosmic/core/providers/btm_nav_bar_provider.dart';
import 'package:cosmic/core/routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/providers/celestial_provider.dart';
import 'core/providers/serviceproviders.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ServicesProvider>(
          create: (context) => ServicesProvider()),
      ChangeNotifierProvider<NavBarProvider>(
          create: (context) => NavBarProvider()),
      ChangeNotifierProvider<CelestialBodiesProvider>(
          create: (context) => CelestialBodiesProvider()),
    ],
    child: const App(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: 'splash',
    );
  }
}
