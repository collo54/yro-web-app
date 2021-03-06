import 'package:flutter/material.dart';
import 'package:yro/pages/event_page.dart';
import 'package:yro/pages/add_contributions_page.dart';
import 'package:yro/pages/home_page.dart';
import 'package:yro/pages/landing_page.dart';

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/LandingPage':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/HomePage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/AddContibutionsPage':
        return MaterialPageRoute(builder: (_) => AddContributionsPage());
      case '/AboutusPage':
        //  if (args is String) {
        return MaterialPageRoute(builder: (_) => EventPage());
      // }
      // return _errorRoute();
      //case '/Portfoliopage':
      //if (args is String) {
      // return MaterialPageRoute(builder: (_) => PortfolioPage());

      //}
      //return _errorRoute();
      // case '/login':
      //if (args is String) {
      //  return MaterialPageRoute(builder: (_) => LogIn());

      //}
      //return _errorRoute();*/

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Center(
          child: Text('error'),
        ),
      );
    });
  }
}
