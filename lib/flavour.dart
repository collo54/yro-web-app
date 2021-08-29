/// Run with:
/// flutter run --flavour dev -t lib/main.dart
/// flutter run --flavour staging -t lib/main_staging.dart
/// flutter run --flavour production -t lib/main_prod.dart
/// NOTE: On iOS, we need to create a matching Xcode scheme

enum Flavour { dev, staging, production }
