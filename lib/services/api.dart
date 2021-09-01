import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:yro/services/api_keys.dart';

class API {
  final String apikey;
  API({@required this.apikey});

  factory API.sandbox() => API(apikey: APIKeys.darajasandboxkey);

  static final String host = 'sandbox.safaricom.co.ke';

  Uri tokenUri() => Uri(
      scheme: "https",
      host: host,
      path: "token",
      queryParameters: {'grant_type': 'client_credentials'});

  dynamic debugPrint() => print('$tokenUri()');
}
