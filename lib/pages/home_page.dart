import 'package:flutter/material.dart';
import 'package:yro/layouts/add_message_firestore.dart';
//import 'package:yro/layouts/Nav_bar.dart';
import 'package:yro/layouts/balance_layout.dart';
import 'package:yro/layouts/chat_content.dart';
import 'package:yro/layouts/sign_out_content.dart';
import 'package:yro/widgets/balance_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navbar(),
            SignOutContent(),
            BalanceLayout(),
            BalanceWidget(),
            AddMessageFirestore(),
            SizedBox(height: 400, child: Chatcontent()),
          ],
        ),
      ),
    );
  }
}
