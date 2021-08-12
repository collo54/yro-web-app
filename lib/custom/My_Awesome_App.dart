import 'package:flutter/material.dart';
import 'package:yro/services/Generate_Route.dart';

class MysomeApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'young revolutionary organization',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      initialRoute: '/Home',
      onGenerateRoute: GenerateRoute.generateRoute,
    );
  }
}
