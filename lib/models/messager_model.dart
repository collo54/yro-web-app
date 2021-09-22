//import 'package:flutter/foundation.dart';

class Messager {
  Messager(
      {this.message,
      this.timeStamp,
      this.name,
      this.userId,
      this.time,
      this.downloadUrl})
      : assert(userId != null);
  final String message;
  final int timeStamp;
  final String name;
  final String userId;
  final String downloadUrl;
  final String time;

  factory Messager.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final int timeStamp = data['timeStamp'];
    final String userId = data['userId'];
    final String message = data['message'];
    final String downloadUrl = data['downloadUrl'];
    final String time = data['time'];

    if (message == null) {
      return null;
    }
    return Messager(
      time: time,
      name: name,
      message: message,
      timeStamp: timeStamp,
      userId: userId,
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

  /*static List<Message> generateMessages() {
    return [
      Message(
        'my funny account blah blah blahmy funny book blah blah blah ',
        '18:40',
      ),
      Message(
        'my funny book blah blah blahmy funny book blah blah blah',
        '18:41',
      ),
      Message(
        'my funny bag blah blah blahmy funny book blah blah blah',
        '18:43',
      ),
      Message(
        'my funny panckacke blah blah blahmy funny book blah blah blah',
        '18:44',
      ),
      Message(
        'my funny account blah blah blahmy funny book blah blah blah',
        '18:45',
      ),
      Message(
        'my funny food blah blah blahmy funny book blah blah blah',
        '18:46',
      ),
      Message(
        'my funny scooter blah blah blahmy funny book blah blah blah',
        '18:50',
      ),
      Message(
        'my funny bike blah blah blahmy funny book blah blah blah',
        '18:30',
      ),
    ];
  }*/
}
