import 'package:flutter/material.dart';
import 'package:yro/layouts/balance_layout.dart';
import 'package:yro/layouts/photo_layout.dart';
import 'package:yro/layouts/ad_stateful_layout.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            BalanceLayout(),
            AdStatefulLayout(),
            Photolayout(),
            Photo1layout(),
            Container(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
