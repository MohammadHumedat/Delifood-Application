import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/favorite_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/account_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPage();
}

class _BottomNavBarPage extends State<BottomNavBarPage> {
  int selectindex = 0;

  List<Widget> selectedpages = const [
    HomePage(),
    FavoritePage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar;

    if (Platform.isAndroid) {
      appBar = AppBar(
        centerTitle: true,
        title: const Text(
          'Delifood',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      );
    } else if (Platform.isIOS) {
      appBar = CupertinoNavigationBar(
        middle: const Text('Delifood',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, color: Colors.black)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      );
    } else {
      appBar = AppBar(
        centerTitle: true,
        title: const Text(
          'Delifood',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 231, 226, 226),
          body: selectedpages[selectindex],
          appBar: appBar, // Using the appBar variable to set the AppBar
          drawer: const Drawer(
            child: Center(
              child: Text('I am in drawer'),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 5, // to give a shadow effect to the bottom bar

            currentIndex: selectindex,
            iconSize: 30,
            selectedFontSize: 20,
            unselectedIconTheme: const IconThemeData(
              color: Color.fromARGB(136, 119, 96, 96),
              size: 25,
            ),
            unselectedFontSize: 15,
            selectedItemColor: Colors.deepOrange,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            onTap: (value) {
              setState(() {
                selectindex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: 'Favorite'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                ),
                label: 'Account',
              ),
            ],
          )),
    );
  }
}
