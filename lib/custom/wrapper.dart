import 'package:flutter/material.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/pages/landing_page.dart';
import 'package:yro/widgets/home_stateful.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key, required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<Userre?> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData
          ? Homestateful() /*HomePage()*/ : LandingPage();
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
