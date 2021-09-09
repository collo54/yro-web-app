import 'package:flutter/material.dart';
import 'package:yro/layouts/balance_layout.dart';
import 'package:yro/layouts/sign_out_content.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            BalanceLayout(),
            SignOutContent(),
          ],
        ),
      ),
    );
  }
}
