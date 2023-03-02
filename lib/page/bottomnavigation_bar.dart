import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/page/farmpedia_page.dart';
import '../page/forums_page.dart';
import '../page/home_page.dart';
import '../page/market_page.dart';
import '../page/settings_page.dart';

class BottomNavigationBarPage extends ConsumerStatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavigationBartState();
}

class _BottomNavigationBartState
    extends ConsumerState<BottomNavigationBarPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    HomePage(),
    FarmPediaPage(),
    MarketPage(),
    ForumsPage(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Farmpedia'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Market'),
            BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Forums'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ]),
    );
  }
}
