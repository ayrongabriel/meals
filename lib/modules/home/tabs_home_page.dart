import 'package:flutter/material.dart';

import 'package:meals/shareds/components/bottom_navigation/app_bottom_navigation.dart';
import 'package:meals/shareds/components/drawer/app_drawer.dart';

class TabsHomePage extends StatefulWidget {
  final List<Widget> pages;

  const TabsHomePage({
    Key? key,
    required this.pages,
  }) : super(key: key);

  @override
  State<TabsHomePage> createState() => _TabsHomePageState();
}

class _TabsHomePageState extends State<TabsHomePage> {
  int _currentIndex = 0;
  late final List<Widget> pages = widget.pages;

  final List _titles = ['', 'Receitas favoritas', 'Configurações'];

  void _onChange(int index) async {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const AppDrawer(),
      body: List.from(pages)[_currentIndex],
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onChange: _onChange,
      ),
    );
  }
}
