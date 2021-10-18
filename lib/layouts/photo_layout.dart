import 'package:flutter/material.dart';

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
            children: pageChildren(constraints.biggest.width / 3, context),
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
        decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        width: width,
        child: _buildPhoto1(context, width),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.green[100],
        ),
        width: width,
        child: _buildPhoto2(context, width),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.green[100],
        ),
        width: width,
        child: _buildPhoto3(context, width),
      ),
    ];
  }

  Widget _buildPhoto1(
    BuildContext context,
    double width,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 16),
        child: Text(
          "yro members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14, left: 16),
        child: Text(
          "members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black45),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 300,
          width: width,
          child: Image.asset("assets/images/watsup1.jpeg", fit: BoxFit.cover),

          //  Image.asset("assets/images/watsup2.jpeg", fit: BoxFit.cover),
          // Image.asset("assets/images/watsup5.jpeg", fit: BoxFit.cover),
        ),
      ),
    ]);
  }

  Widget _buildPhoto2(
    BuildContext context,
    double width,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 16),
        child: Text(
          "yro members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14, left: 16),
        child: Text(
          "members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black45),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 300,
          width: width,
          child: Image.asset("assets/images/watsup2.jpeg", fit: BoxFit.cover),
          // Image.asset("assets/images/watsup5.jpeg", fit: BoxFit.cover),
        ),
      ),
    ]);
  }

  Widget _buildPhoto3(
    BuildContext context,
    double width,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 16),
        child: Text(
          "yro members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14, left: 16),
        child: Text(
          "members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black45),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 300,
          width: width,
          child: Image.asset(
            "assets/images/pic2.jpg",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),

          //  Image.asset("assets/images/watsup2.jpeg", fit: BoxFit.cover),
          // Image.asset("assets/images/watsup5.jpeg", fit: BoxFit.cover),
        ),
      ),
    ]);
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
            children: pageChildren(constraints.biggest.width / 3, context),
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
        decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        width: width,
        child: _buildPhoto1(context, width),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.green[100],
        ),
        width: width,
        child: _buildPhoto2(context, width),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.green[100],
        ),
        width: width,
        child: _buildPhoto3(context, width),
      ),
    ];
  }

  Widget _buildPhoto1(
    BuildContext context,
    double width,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 16),
        child: Text(
          "yro members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14, left: 16),
        child: Text(
          "members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black45),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 300,
          width: width,
          child: Image.asset(
            "assets/images/pic3.jpg",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),

          //  Image.asset("assets/images/watsup2.jpeg", fit: BoxFit.cover),
          // Image.asset("assets/images/watsup5.jpeg", fit: BoxFit.cover),
        ),
      ),
    ]);
  }

  Widget _buildPhoto2(
    BuildContext context,
    double width,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 16),
        child: Text(
          "yro members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14, left: 16),
        child: Text(
          "members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black45),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 300,
          width: width,
          child: Image.asset(
            "assets/images/pic6.jpg",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
          // Image.asset("assets/images/watsup5.jpeg", fit: BoxFit.cover),
        ),
      ),
    ]);
  }

  Widget _buildPhoto3(
    BuildContext context,
    double width,
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 16),
        child: Text(
          "yro members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14, left: 16),
        child: Text(
          "members meeting",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black45),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 300,
          width: width,
          child: Image.asset(
            "assets/images/pic4.jpg",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),

          //  Image.asset("assets/images/watsup2.jpeg", fit: BoxFit.cover),
          // Image.asset("assets/images/watsup5.jpeg", fit: BoxFit.cover),
        ),
      ),
    ]);
  }
}
