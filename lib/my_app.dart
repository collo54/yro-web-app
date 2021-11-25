import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/custom/wrapper_builder.dart';
import 'custom/wrapper.dart';
import 'models/user_model.dart';
import 'services/AuthService.dart';
import 'services/image_picker_service.dart';
import 'services/Generate_Route.dart';

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyYro(); //MyAwesomeApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class MyAwesomeApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userre?>.value(
      value: AuthService().onAuthStateChanged,
      initialData: null,
      child: MaterialApp(
        title: 'yro',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Roboto'),
        initialRoute: '/',
        onGenerateRoute: GenerateRoute.generateRoute,
      ),
    );
  }
}

class MyYro extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(),
          ),
          Provider<ImagePickerService>(
            create: (_) => ImagePickerService(),
          ),
        ],
        child: WrapperBuilder(builder: (context, userSnapshot) {
          return MaterialApp(
            title: 'yro',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Roboto'),
            home: Wrapper(
              userSnapshot: userSnapshot,
            ),
            onGenerateRoute: GenerateRoute.generateRoute,
          );
        }));
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Text('error'),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
