import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yro/custom/My_Awesome_App.dart';
import 'package:yro/models/user_model.dart';
import 'package:yro/screens/MenuScreen.dart';
//import 'package:yro/screens/My_Home_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userre>(context);

    if (user == null) {
      return MysomeApp();
    } else {
      return MenuScreen();
    }
  }
}
