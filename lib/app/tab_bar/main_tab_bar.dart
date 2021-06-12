import 'package:flutter/material.dart';
import 'package:flutter_samples/app/tab_bar/tab_indicator/dot_indicator.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({Key? key}) : super(key: key);

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Demo'),
        bottom: TabBar(
          controller: _tabController,
          indicator: DotIndicator(),
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.dashboard)),
            Tab(icon: Icon(Icons.settings)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Icon(Icons.home, size: 100),
          Icon(Icons.dashboard, size: 100),
          Icon(Icons.settings, size: 100),
        ],
      ),
    );
  }
}
