import 'package:flutter/material.dart';

import '../pages/auth_screens/screens/authchecker.dart';
import '../pages/auth_screens/screens/forgot_password.dart';
import '../pages/auth_screens/screens/login.dart';
import '../pages/auth_screens/screens/signup.dart';
import '../pages/main_screens/screens/favourites.dart';
import '../pages/main_screens/screens/homepage.dart';
import '../pages/main_screens/screens/mainhub.dart';
import '../pages/main_screens/screens/morepage.dart';
import '../pages/main_screens/screens/profile_page.dart';
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
      case 'authChecker':
        return MaterialPageRoute(builder: (_) => const AuthChecker());
      case 'homePage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case 'forgotPassword':
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case 'morePage':
        return MaterialPageRoute(builder: (_) => const MorePage());
      case 'favourites':
        return MaterialPageRoute(builder: (_) => const Favourites());
      case 'profilePage':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case 'mainHub':
        return MaterialPageRoute(builder: (_) => const MainHub());
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
