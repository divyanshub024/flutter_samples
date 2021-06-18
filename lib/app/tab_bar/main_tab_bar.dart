import 'package:flutter/material.dart';
import 'package:flutter_samples/app/tab_bar/tab_indicator/dot_indicator.dart';
import 'package:flutter_samples/app/tab_bar/tab_indicator/outline_indicator.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({Key? key}) : super(key: key);

  @override
  _MainTabBarState createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Decoration _currentIndicator;

  final Map<String, Decoration> _indicators = {
    'Dot Indicator': DotIndicator(),
    'Outline Indicator': OutlineIndicator(),
  };

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _currentIndicator = _indicators.values.first;
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
      appBar: _appBar,
      body: _body,
    );
  }

  AppBar get _appBar => AppBar(
        title: Text('Tabs Demo'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list_rounded),
            onPressed: () => _showBottomSheet(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicator: _currentIndicator,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.dashboard)),
            Tab(icon: Icon(Icons.settings)),
          ],
        ),
      );

  Widget get _body => TabBarView(
        controller: _tabController,
        children: [
          Icon(Icons.home, size: 100),
          Icon(Icons.dashboard, size: 100),
          Icon(Icons.settings, size: 100),
        ],
      );

  void _showBottomSheet() {
    final List<Widget> tiles = [];
    _indicators.forEach((key, value) {
      var tile = ListTile(
        title: Text(key),
        onTap: () {
          setState(() {
            _currentIndicator = value;
          });
          Navigator.pop(context);
        },
      );
      tiles.add(tile);
    });

    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: tiles,
      ),
    );
  }
}
