import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/flavour.dart';
import 'package:yro/my_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:yro/services/ad_state.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initfuture = MobileAds.instance.initialize();
  final adstate = AdState(initfuture);
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    FacebookAuth.i.webInitialize(
      appId: "492880481826063", //<-- YOUR APP_ID
      cookie: true,
      xfbml: true,
      version: "v9.0",
    );
  }
  // runApp(Provider<Flavour>.value(value: Flavour.dev, child: MyApp()));
  runApp(
    MultiProvider(providers: [
      Provider<AdState>.value(value: adstate),
      Provider<Flavour>.value(value: Flavour.dev),
    ], child: MyApp()),
  );
}
