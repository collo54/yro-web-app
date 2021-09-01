import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/pages/home_page.dart';
import 'package:yro/pages/landing_page.dart';
import 'package:yro/services/AuthService.dart';
import 'package:yro/widgets/getTokentest.dart';
//import 'package:yro/services/AuthService.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userre>(context);

    if (user == null) {
      return Demo();
      /*LandingPage(
        auth: AuthService(),
      );*/
    } else {
      return HomePage();
    }
  }
}
/*class Wrapper extends StatelessWidget {
  Wrapper({@required this.auth});
  final AuthService auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Userre>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            Userre user = snapshot.data;
            if (user == null) {
              return LandingPage(
                auth: auth,
              );
            }
            return HomePage(
              auth: auth,
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}*/
