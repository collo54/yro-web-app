import 'package:flutter/material.dart';

class YesNoSelection extends StatelessWidget {
  const YesNoSelection({this.onPressed, this.onPressed2});
  final VoidCallback? onPressed;
  final VoidCallback? onPressed2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
            onPressed: onPressed,
            child: Icon(Icons.favorite),
          ),
          /* SizedBox(width: 25),
          TextButton(
            onPressed: onPressed2,
            child: Icon(Icons.favorite_outline_outlined),
          ),*/
        ],
      ),
    );
  }
}
