import 'package:flutter/material.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/pages/home_page.dart';
import 'package:yro/pages/landing_page.dart';
import 'package:yro/widgets/home_stateful.dart';
//import 'package:yro/services/AuthService.dart';
//import 'package:yro/services/firebase_storage_service.dart';
//import 'package:yro/services/firestore_service.dart';
//import 'package:provider/provider.dart';

/*class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userre>(context);

    if (user == null) {
      return //Demo();
          LandingPage();
    } else {
      return HomePage();
    }
  }
}*/

/*class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);

    return StreamBuilder<Userre>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user != null) {
              return MultiProvider(
                providers: [
                  Provider<Userre>.value(value: user),
                  Provider<FirebaseStorageService>(
                    create: (_) => FirebaseStorageService(uid: user.uid),
                  ),
                  Provider<FirestoreService>(
                    create: (_) => FirestoreService(uid: user.uid),
                  ),
                ],
                child: HomePage(),
              );
            }
            return LandingPage();
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

class Wrapper extends StatelessWidget {
  const Wrapper({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<Userre> userSnapshot;

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
