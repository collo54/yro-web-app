import 'package:flutter/material.dart';
import 'package:yro/layouts/balance_layout.dart';
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
            BalanceLayout(),
            BalanceWidget(),
            SignOutContent(),
            Container(
              height: 55,
            )
          ],
        ),
      ),
    );
  }
}
