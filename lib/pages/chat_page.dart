import 'package:flutter/material.dart';
import 'package:yro/layouts/avator_layout.dart';
import 'package:yro/layouts/message_form_layout.dart';
import 'package:yro/layouts/new_chat_layout.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Avatorlayout(),
            Container(height: 390, child: NewChatLayout()),
            MessageFormLayout(),
            Container(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
