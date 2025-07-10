import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/pages/bottom_navigation_bar.dart';
import 'package:food_delivery/pages/food_details_page.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures that the binding is initialized before setting preferred orientations
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
      debugShowCheckedModeBanner:
          false, // Disable the debug banner in the top right corner of the app
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ).copyWith(
          primary: Colors.deepOrange,
          secondary: Colors.deepOrange,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.deepOrange,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.deepOrange,
            side: const BorderSide(color: Colors.deepOrange),
          ),
        ),
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
      // home: const BottomNavBarPage(),
      routes: {
        // Navigate using the named routes
        '/': (context) => const BottomNavBarPage(),
        '/food-details': (context) => const FoodDetailsPage(),
      },
    );
  }
}
