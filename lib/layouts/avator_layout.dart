import 'package:flutter/material.dart';

class Avatorlayout extends StatefulWidget {
  @override
  _AvatorLayoutState createState() => _AvatorLayoutState();
}

class _AvatorLayoutState extends State<Avatorlayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: width,
        child: _buildPhoto(context, width),
      ),
    ];
  }

  Widget _buildPhoto(
    BuildContext context,
    double width,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 500,
          width: width,
          child: Image.asset("assets/images/watsup1.jpeg", fit: BoxFit.cover),
        ),
      ),
    ]);
  }
}
