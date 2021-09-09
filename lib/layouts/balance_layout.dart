import 'package:flutter/material.dart';
import 'package:yro/widgets/avator_widget.dart';
import 'package:yro/widgets/balance_card.dart';

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
            child: TopNeuCard(
              balance: '2000',
              income: '100',
              expense: '50',
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
            child: TopNeuCard(
              balance: '5000',
              expense: '150',
              income: '200',
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
