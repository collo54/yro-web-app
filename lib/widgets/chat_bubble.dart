import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {@required this.text,
      @required this.isCurrentUser,
      @required this.time,
      @required this.name});
  final String text;
  final bool isCurrentUser;
  final String time;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Align(
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isCurrentUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: // Flexible(
                // child:
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(time.toString()),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                )
              ],
            ),
            // ),
            /*Text(
              text,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: isCurrentUser ? Colors.white : Colors.black87),
            ),*/
          ),
        ),
      ),
    );
  }
}
