import 'package:flutter/material.dart';
import 'package:movies/screens/search_screen.dart';
import 'package:movies/screens/watchlist_screen.dart';

import 'home_screen.dart';
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int index = 0;

  final List<Widget> screens = [
    const HomeScreen(),
     SearchScreen(),
    WatchlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[index],
      
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (val) {
            setState(() {
              index = val;
            });
          },
          backgroundColor: Colors.grey.shade900,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Watchlist"),
          ],
        ),
      ),
    );
  }
}