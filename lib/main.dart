import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/pages/bottom_navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();// Ensures that the binding is initialized before setting preferred orientations
  // Lock the app orientation to portrait mode
  // This is useful for apps that are designed to be used in portrait mode only
  // It prevents the app from rotating to landscape mode, which can be useful for certain types of apps
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// Disable the debug banner in the top right corner of the app
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 231, 226, 226),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 223, 219, 219),
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 2,
          indent: 17,
          endIndent: 17,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.deepOrange,
        ),
        fontFamily: 'OpenSans',
      ),
      home: const BottomNavBarPage(),
    );
  }
}
