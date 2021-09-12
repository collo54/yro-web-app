import 'package:flutter/foundation.dart';

class Contributor {
  Contributor({@required this.name, @required this.contributionsPerMonth});
  final String name;
  final int contributionsPerMonth;

  factory Contributor.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final int contributionsPerMonth = data['contributionsPerMonth'];
    if (name == null || contributionsPerMonth == null) {
      return null;
    }
    return Contributor(
        name: name, contributionsPerMonth: contributionsPerMonth);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contributionsPerMonth': contributionsPerMonth,
    };
  }
}
