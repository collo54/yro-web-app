import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/pages/home_page.dart';
import 'package:yro/pages/landing_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userre>(context);

    if (user == null) {
      return LandingPage();
    } else {
      return HomePage();
    }
  }
}
