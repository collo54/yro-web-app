import 'package:flutter/material.dart';
import 'package:yro/models/contributor_model.dart';

class PicCard extends StatelessWidget {
  final Contributor contributor;
  final VoidCallback onTap;
  final String name;
  final String caption;
  final String heading;
  final double width;
  PicCard(
      {Key key,
      @required this.contributor,
      @required this.caption,
      @required this.heading,
      @required this.name,
      this.width,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Ink(
        height: 300,
        child: InkWell(
          splashColor: Colors.white70,
          onTap: onTap,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16),
                  child: Text(
                    heading,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 16),
                  child: Text(
                    caption,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black45),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 500,
                      width: 1400,
                      margin: EdgeInsets.all(15),
                      child: Image.asset(
                        name,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.medium,
                      ),

                      //  Image.asset("assets/images/watsup2.jpeg", fit: BoxFit.cover),
                      // Image.asset("assets/images/watsup5.jpeg", fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade500,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ]),
      ),
    );
  }
}
 // ignore: non_constant_iden
