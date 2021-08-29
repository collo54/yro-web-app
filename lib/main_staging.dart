import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/flavour.dart';
import 'package:yro/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Provider<Flavour>.value(value: Flavour.staging, child: MyApp()));
}
