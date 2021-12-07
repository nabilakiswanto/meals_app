import 'package:flutter/material.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoriteScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //MENU BAR ON TOP
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 1,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('McMeals'),
    //       bottom: TabBar(

    //         tabs: [
    //           Tab(icon: Icon(Icons.category), text: 'Categories',),
    //           Tab(icon: Icon(Icons.star), text: 'Favorites',),
    //         ]),
    //     ),
    //     body: TabBarView(children: [
    //       CategoriesScreen(), FavoriteScreen(),
    //     ]),
    //   ),
    // );

    //MENU BAR ON BOTTOM
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      //hamburger button
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedFontSize: 13,
        unselectedItemColor: Colors.white,
        selectedFontSize: 17,
        selectedItemColor: Theme.of(context).accentColor,
        //set the active page bar
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
