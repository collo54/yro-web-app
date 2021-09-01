import 'dart:convert';
import 'api.dart';
import 'package:http/http.dart' as http;

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getAccessToken() async {
    final url =
        "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Basic ${api.apikey}',
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    //print(
    // 'Request $url failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }
}
