import 'package:flutter/material.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/search_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPage();
}

class _BottomNavBarPage extends State<BottomNavBarPage> {
  int selectindex = 0;

  List<Widget> selectedpages = const [
    HomePage(),
    SearchPage(),
    FavoritePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 226, 226),
        body: selectedpages[selectindex],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Delifood',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 223, 219, 219),
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        drawer: const Drawer(
          child: Center(
            child: Text('I am in drawer'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectindex,
          selectedItemColor: Colors.deepOrange,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (value) {
            setState(() {
              selectindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
          ],
        ));
  }
}
