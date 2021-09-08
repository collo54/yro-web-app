import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/services/AuthService.dart';
import 'package:yro/services/firebase_storage_service.dart';
import 'package:yro/services/firestore_service.dart';

class WrapperBuilder extends StatelessWidget {
  const WrapperBuilder({Key key, @required this.builder}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<Userre>) builder;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);

    return StreamBuilder<Userre>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
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
              child: builder(context, snapshot), //HomePage(),
            );
          }
          return builder(context, snapshot); //LandingPage();
        });
  }
}
