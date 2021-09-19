import 'package:flutter/foundation.dart';

class Messager {
  Messager(
      {@required this.message,
      @required this.timeStamp,
      @required this.name,
      @required this.userId,
      @required this.time,
      @required this.timeZone})
      : assert(userId != null);
  final String message;
  final int timeStamp;
  final String name;
  final String userId;
  final String timeZone;
  final String time;

  factory Messager.fromMap(Map<String, dynamic> data) {
    if (data == null) {
      return null;
    }
    final String name = data['name'];
    final int timeStamp = data['timeStamp'];
    final String userId = data['userId'];
    final String message = data['message'];
    final String timeZone = data['timeZone'];
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
      timeZone: timeZone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'userId': userId,
      'message': message,
      'timeStamp': timeStamp,
      'timeZone': timeZone,
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
