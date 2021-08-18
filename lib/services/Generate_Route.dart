import 'package:flutter/material.dart';
import 'package:yro/custom/wrapper.dart';

import 'package:yro/screens/My_Home_Page.dart';
/*import 'package:youthrevolution/screens/portfolio_page.dart';
import 'package:youthrevolution/screens/log_in_page.dart';*/

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/wrapper':
        return MaterialPageRoute(builder: (_) => Wrapper());
      case '/Home':
        return MaterialPageRoute(builder: (_) => MyHomePage());
      /* case '/Aboutus':
        //if (args is String) {
        return MaterialPageRoute(builder: (_) => AboutUs());

      //}
      //return _errorRoute();
      case '/Portfoliopage':
        //if (args is String) {
        return MaterialPageRoute(builder: (_) => PortfolioPage());

      //}
      //return _errorRoute();
      case '/login':
        //if (args is String) {
        return MaterialPageRoute(builder: (_) => LogIn());

      //}
      //return _errorRoute();*/

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Text('error'),
        ),
      );
    });
  }
}
