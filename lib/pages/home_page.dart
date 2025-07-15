// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/UI_models/food_details_argus.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/utilities/app_assets.dart';
import 'package:food_delivery/widget/category_food_list.dart';
import 'package:food_delivery/widget/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<FoodItem> filteredFood;
  final enableFiltercategory = false;
  @override
  void initState() {
    // Initialize the filteredFood variable, to restore the food list when the app is restarted
    super.initState();
    filteredFood = food;
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final TextScale = MediaQuery.of(context).textScaler;
    final bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    void _updateFilteredFood(List<FoodItem> newFilteredFood) {
      // Update the filtered food list
      setState(() {
        filteredFood = newFilteredFood;
        
      });
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                AppAssets.burgerBanner,
                height: isLandScape
                    // Check if the device is in landscape mode,using a ternary operator
                    ? size.height * 0.5
                    : size.height * 0.23,
                fit: BoxFit.cover,
              ), //
            ),
            const SizedBox(height: 25),
            CategoryFoodList(
              filteredFood: filteredFood,
              onFilterChanged:
                  _updateFilteredFood,
                  
                   // Pass the updateFilteredFood function
            ),
            // if (Platform.isIOS)
            //   const Text(
            //       'The device have IOS OS'), // Check if the device is IOS, using a conditional statement
            // if (Platform.isAndroid)
            //   const Text(
            //       'The device have Android OS'), // Check if the device is Android, using a conditional statement
            const SizedBox(height: 20),
            GridView.builder(
                shrinkWrap:
                    true, //to make the grid view take only the space it needs
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredFood.length,
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
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        final targetedFoodItem = food.firstWhere(
                            (item) => item.id == filteredFood[index].id);
                        final targetedIndex = food.indexOf(targetedFoodItem);
                        Navigator.of(context)
                            .pushNamed(FoodDetailsPage.routeName,
                                arguments:
                                    FoodDetailsArgus(foodIndex: targetedIndex))
                            .then((value) {
                          setState(() {});
                          filteredFood = food;
                          
                          debugPrint(
                              'This is the food item name $targetedIndex');
                        }); // Refresh the home page after returning from the details page
                      },
                      child: FoodGridItem(
                        foodIndex: index,
                        filteredFood: filteredFood,
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
