import 'package:flutter/material.dart';
import 'package:yro/models/contributor_model.dart';
import 'package:yro/widgets/avator_widget.dart';
import 'package:yro/widgets/top_up_card.dart';

class BalanceLayout extends StatelessWidget {
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
            height: 300,
            width: 1400,
            child: TopUpCard(
              contributor: Contributor(
                  name: 'name',
                  contributionPerMonth: 0,
                  deposited: 0,
                  withdrawn: 0),
              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: AvatorWidget(),
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
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 300,
            width: 1400,
            child: TopUpCard(
              contributor: Contributor(
                  id: '0',
                  name: 'name',
                  contributionPerMonth: 0,
                  deposited: 0,
                  withdrawn: 0),
              onTap: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: AvatorWidget(),
        ),
      ],
    );
  }
}
