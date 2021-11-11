import 'package:flutter/material.dart';
import 'package:yro/constants/colors.dart';
import 'package:yro/widgets/pic_card.dart';

class Photolayout extends StatefulWidget {
  @override
  _PhotoLayoutState createState() => _PhotoLayoutState();
}

class _PhotoLayoutState extends State<Photolayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width / 4, context),
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
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: kPrimaryLight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: _buildPhoto1(
            context,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.greenAccent[400],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: _buildPhoto2(context, width),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.greenAccent[400],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: _buildPhoto3(context, width),
        ),
      ),
    ];
  }

  Widget _buildPhoto1(
    BuildContext context,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: 'assets/images/watsup1.jpeg',
      onTap: () {},
    );
  }

  Widget _buildPhoto2(
    BuildContext context,
    double width,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: 'assets/images/watsup2.jpeg',
      onTap: () {},
    );
  }

  Widget _buildPhoto3(
    BuildContext context,
    double width,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: 'assets/images/pic2.jpg',
      onTap: () {},
    );
  }
}

class Photo1layout extends StatefulWidget {
  @override
  _Photo1LayoutState createState() => _Photo1LayoutState();
}

class _Photo1LayoutState extends State<Photo1layout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width / 4, context),
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
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.indigoAccent[400],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          width: width,
          child: _buildPhoto1(context, width),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.greenAccent[400],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: _buildPhoto2(context, width),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.greenAccent[400],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          width: width,
          child: _buildPhoto3(context, width),
        ),
      ),
    ];
  }

  Widget _buildPhoto1(
    BuildContext context,
    double width,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: "assets/images/pic3.jpg",
      onTap: () {},
    );
  }

  Widget _buildPhoto2(
    BuildContext context,
    double width,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: "assets/images/pic6.jpg",
      onTap: () {},
    );
  }

  Widget _buildPhoto3(
    BuildContext context,
    double width,
  ) {
    return PicCard(
      contributor: null,
      caption: 'top planters',
      heading: 'conservation day',
      name: "assets/images/pic4.jpg",
      onTap: () {},
    );
  }
}
