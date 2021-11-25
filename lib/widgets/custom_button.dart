import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.child,
    this.color,
    this.height: 50.0,
    this.onPressed,
  });
  final Widget? child;
  final Color? color;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: MaterialButton(
        child: child,
        color: color,
        shape: CircleBorder(side: BorderSide.none),
        onPressed: onPressed,
      ),
    );
  }
}
