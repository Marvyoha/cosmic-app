import 'package:cosmic/pages/auth_screens/screens/forgot_password.dart';
import 'package:flutter/material.dart';

import '../pages/auth_screens/screens/login.dart';
import '../pages/auth_screens/screens/signup.dart';
import '../splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => const Splash());
      case 'login':
        return MaterialPageRoute(builder: (_) => const Login());
      case 'signup':
        return MaterialPageRoute(builder: (_) => const SignUp());
      case 'forgotPassword':
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Center(child: Text('No Routes Found')),
          ));
}
