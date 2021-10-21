import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {
  Future<InitializationStatus> initialization;
  AdState(this.initialization);

  String get bannerAdUnitId => 'ca-app-pub-3940256099942544/6300978111';

  BannerAdListener get adListener => _adListener;

  BannerAdListener _adListener = BannerAdListener(
    onAdLoaded: (ad) => print('Ad loaded: ${ad.adUnitId}'),
    onAdClosed: (ad) => print('Ad closed: ${ad.adUnitId}'),
    onAdFailedToLoad: (ad, error) =>
        print('Ad failed to load: ${ad.adUnitId}, $error'),
    onAdOpened: (ad) => print('Ad opened: ${ad.adUnitId}'),
    onAdImpression: (ad) => print('Ad impression: ${ad.adUnitId}'),
    onAdWillDismissScreen: (ad) =>
        print('Ad will dismiss screen: ${ad.adUnitId}'),
  );
}
