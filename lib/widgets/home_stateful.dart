import 'package:flutter/material.dart';
import 'package:yro/layouts/cupertino_home_scaffold.dart';
import 'package:yro/pages/event_page.dart';
import 'package:yro/pages/home_page.dart';
import 'package:yro/widgets/tab_item.dart';

class Homestateful extends StatefulWidget {
  @override
  _HomestatefulState createState() => _HomestatefulState();
}

class _HomestatefulState extends State<Homestateful> {
  TabItem _currentTab = TabItem.events;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.events: (_) => HomePage(),
      TabItem.chatcontent: (_) => EventPage(),
      TabItem.userprofile: (_) => Container(),
    };
  }

  void _select(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScaffold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }
}
