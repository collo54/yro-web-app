import 'package:flutter/material.dart';
import 'package:yro/widgets/custom_button.dart';

class FormSubmitButton extends CustomButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          height: 44.0,
          color: Colors.indigo[700],
          onPressed: onPressed,
        );
}
