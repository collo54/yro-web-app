import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/flavour.dart';
import 'package:yro/my_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yro/services/ad_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initfuture = MobileAds.instance.initialize();
  final adstate = AdState(initfuture);
  // runApp(Provider<Flavour>.value(value: Flavour.dev, child: MyApp()));
  runApp(
    MultiProvider(providers: [
      Provider<AdState>.value(value: adstate),
      Provider<Flavour>.value(value: Flavour.dev),
    ], child: MyApp()),
  );
}
