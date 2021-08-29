import 'package:flutter/material.dart';

import 'package:yro/layouts/Nav_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(color: Colors.grey[350], child: Navbar()),
          ],
        ),
      ),
    );
  }
}
