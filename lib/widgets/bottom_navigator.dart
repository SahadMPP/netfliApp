import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home.dart';
import 'package:netflix_clone/screens/profile_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';

class BottomNavigatorMain extends StatefulWidget {
  const BottomNavigatorMain({super.key});

  @override
  State<BottomNavigatorMain> createState() => _BottomNavigatorMainState();
}

class _BottomNavigatorMainState extends State<BottomNavigatorMain> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const Home(),
    const SearchScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 55,
        backgroundColor: Colors.black,
        elevation: 0,
        animationDuration: const Duration(seconds: 1),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorColor: Colors.black,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home, size: 30), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.search, size: 30), label: 'Search'),
          NavigationDestination(
              icon: Icon(Icons.person, size: 30), label: 'Profile'),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}
