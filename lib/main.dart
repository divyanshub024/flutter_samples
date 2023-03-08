import 'package:flutter/material.dart';
import 'package:flutter_samples/app/infinity_path_animation/infinity_path_animation.dart';
import 'package:flutter_samples/app/tab_bar/main_tab_bar.dart';
import 'package:flutter_samples/config/app_router.dart';
import 'package:flutter_samples/values/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Samples',
      navigatorKey: AppRouter.navigatorKey,
      theme: AppTheme.themeData,
      home: MyHomePage(title: 'Flutter Samples'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final Map<String, Widget> _screens = {
    'Custom TabBar Indicator': const MainTabBar(),
    'Infinity Path Animation': const InfinityPathAnimation(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: _buildTiles(context),
      ),
    );
  }

  List<Widget> _buildTiles(BuildContext context) {
    final List<Widget> tiles = [];
    _screens.forEach((key, value) {
      var tile = ListTile(
        title: Text(key),
        onTap: () => AppRouter.push(value),
      );
      tiles.add(tile);
    });

    return tiles;
  }
}
