import 'package:flutter/material.dart';

import 'categories_screen.dart';
import './favorite_screen.dart';
import '../Widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Jonah Restaurant App',
      'page': CategoryScreen(),
    },
    {
      'title': 'Your Favorite',
      'page': FavoriteScreen(),
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).canvasColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_sharp), label: 'Favorite'),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectPage,
      ),
    );
  }
}
