import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widget/food_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextScale = MediaQuery.of(context).textScaler;
    final bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                'assets/images/classic_burger.jpg',
                height: isLandScape
                    // Check if the device is in landscape mode,using a ternary operator
                    ? size.height * 0.5
                    : size.height * 0.23,
                fit: BoxFit.cover,
              ),
            ),
            if (Platform.isIOS)
              const Text(
                  'The device have IOS OS'), // Check if the device is IOS, using a conditional statement
            if (Platform.isAndroid)
              const Text(
                  'The device have Android OS'), // Check if the device is Android, using a conditional statement
            const SizedBox(height: 30),
            GridView.builder(
              shrinkWrap:
                  true, //to make the grid view take only the space it needs
              physics: const NeverScrollableScrollPhysics(),
              itemCount: food.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandScape
                    ? 3
                    : 2, // number of items in a row, changes based on orientation,1 for landscape and 3 for portrait
                childAspectRatio: isLandScape
                    ? 1.5
                    : 1.2, // this ratio adjusts the height and width of each grid item
                crossAxisSpacing: size.height * 0.01,
                mainAxisSpacing: size.height * 0.01,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8),
                child: FoodGridItem(
                  foodIndex: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
