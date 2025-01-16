import 'package:flutter/material.dart';
import 'package:tab_bar_indicator/src/tab_indicator/dot_indicator.dart';
import 'package:tab_bar_indicator/src/tab_indicator/outline_indicator.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Decoration _currentIndicator;

  final Map<String, Decoration> _indicators = {
    'Dot Indicator': const DotIndicator(),
    'Outline Indicator': const OutlineIndicator(),
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
        title: const Text('Tabs Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () => _showBottomSheet(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicator: _currentIndicator,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.dashboard)),
            Tab(icon: Icon(Icons.settings)),
          ],
        ),
      );

  Widget get _body => TabBarView(
        controller: _tabController,
        children: const [
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
      useSafeArea: true,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: tiles,
      ),
    );
  }
}
