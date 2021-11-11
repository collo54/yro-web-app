import 'package:flutter/material.dart';
import 'package:yro/widgets/avator_widget.dart';
import 'package:yro/widgets/pic_card.dart';

class PicCardLayout extends StatelessWidget {
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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 400,
            width: 1400,
            child: PicCard(
              contributor: null,
              caption: 'top planters',
              heading: 'conservation day',
              name: 'assets/images/watsup1.jpeg',
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
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 400,
            width: 1400,
            child: PicCard(
              contributor: null,
              onTap: () {},
              caption: 'top planters',
              heading: 'conservation day',
              name: 'assets/images/watsup1.jpeg',
            ),
          ),
        ),
      ],
    );
  }
}
