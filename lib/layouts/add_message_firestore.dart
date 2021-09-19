import 'package:flutter/material.dart';
import 'package:yro/pages/chat_firebase.dart';

class AddMessageFirestore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          color: Colors.indigo[100],
          shape: CircleBorder(side: BorderSide.none),
          onPressed: () => ChatFirebase.show(context),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Icon(
              Icons.message_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          color: Colors.indigo[100],
          shape: CircleBorder(side: BorderSide.none),
          onPressed: () =>
              ChatFirebase.show(context), //_createContributor(context),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Icon(
              Icons.message_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
