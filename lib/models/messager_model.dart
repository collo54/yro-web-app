//import 'package:flutter/foundation.dart';

class Messager {
  Messager(
      {this.message,
      this.timeStamp,
      this.name,
      this.userId,
      this.time,
      this.downloadUrl});
  final String? message;
  final int? timeStamp;
  final String? name;
  final String? userId;
  final String? downloadUrl;
  final String? time;

  factory Messager.fromMap(Map<String, dynamic> data) {
    final String? name = data['name'];
    final int? timeStamp = data['timeStamp'];
    final String? userId = data['userId'];
    final String? message = data['message'];
    final String? downloadUrl = data['downloadUrl'];
    final String? time = data['time'];

    return Messager(
      time: time,
      name: name,
      message: message,
      timeStamp: timeStamp,
      userId: userId!,
      downloadUrl: downloadUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
      'name': name,
      'userId': userId,
      'message': message,
      'timeStamp': timeStamp,
      'time': time,
    };
  }
}
