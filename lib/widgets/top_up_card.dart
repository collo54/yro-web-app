import 'package:flutter/material.dart';
import 'package:yro/models/contributor_model.dart';

class TopUpCard extends StatelessWidget {
  final Contributor contributor;
  final VoidCallback onTap;
  TopUpCard({Key key, @required this.contributor, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Ink(
        height: 300,
        child: InkWell(
          splashColor: Colors.cyan,
          onTap: onTap,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(contributor.name,
                    style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                Text('B A L A N C E',
                    style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                Text(
                  '\$' + contributor.contributionPerMonth.toString(),
                  style: TextStyle(color: Colors.grey[800], fontSize: 40),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('deposited',
                                  style: TextStyle(color: Colors.grey[500])),
                              SizedBox(
                                height: 5,
                              ),
                              Text('\$' + contributor.deposited.toString(),
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('withdrawn',
                                  style: TextStyle(color: Colors.grey[500])),
                              SizedBox(
                                height: 5,
                              ),
                              Text('\$' + contributor.withdrawn.toString(),
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
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
