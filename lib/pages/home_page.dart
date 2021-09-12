import 'package:flutter/material.dart';
import 'package:yro/layouts/Nav_bar.dart';
import 'package:yro/layouts/balance_firestore.dart';
import 'package:yro/layouts/balance_layout.dart';
import 'package:yro/layouts/sign_out_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(),
            SignOutContent(),
            BalanceLayout(),
            BalanceFirestore(),
          ],
        ),
      ),
    );
  }
}
