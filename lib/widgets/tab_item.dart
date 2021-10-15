import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem { events, chatcontent, userprofile }

class TabItemData {
  const TabItemData({@required this.label, @required this.icon});
  final String label;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.events: TabItemData(label: 'Events', icon: Icons.event),
    TabItem.chatcontent: TabItemData(label: 'Chat', icon: Icons.chat),
    TabItem.userprofile: TabItemData(label: 'Account', icon: Icons.person)
  };
}
