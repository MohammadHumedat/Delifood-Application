// import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodDetailsPage extends StatefulWidget {
  final FoodItem foodItem;
  const FoodDetailsPage({super.key, required this.foodItem});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteItems =
        food.where((foodItem) => foodItem.isFavorite == true).toList();
    // double sizeFactor = MediaQuery.of(context).size.height / 100;
    final size = MediaQuery.of(context).size;

    var textScale = MediaQuery.of(context).textScaler;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: _buildAppBar(context),
      body: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 240, 240),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 230, 227, 226),
                                iconColor: Colors.deepOrangeAccent,
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.chevron_left,
                                size: 35,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 230, 227, 226),
                                  iconColor: Colors.deepOrangeAccent),
                              onPressed: () {
                                final targeteditem = widget
                                    .foodItem; // Get the current food item
                                // Find the index of the targeted item in the food list
                                int targetedIndex = food.indexOf(
                                    targeteditem); // Get the index of the targeted item
                                // Update the state to remove the item from favorites
                                setState(() {
                                  // Toggle the isFavorite property
                                  food[targetedIndex] = food[targetedIndex]
                                      .copywith(
                                          isFavorite:
                                              !food[targetedIndex].isFavorite);
                                  favoriteItems.remove(targeteditem);
                                });
                              },
                              child: Icon(
                                widget.foodItem.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.deepOrange,
                                size: textScale
                                    .scale(23), // Use textScaler for scaling
                                semanticLabel: widget.foodItem
                                        .isFavorite // ternary operator for accessibility
                                    ? 'Remove from favorites'
                                    : 'Add to favorites', // Accessibility label for screen readers
                                textDirection: TextDirection
                                    .ltr, // Ensure correct text direction
                              ),
                            ),
                          ],
                        ),
                        Align( // Align the image to the center
                          heightFactor: size.height * 0.0016,
                          alignment: Alignment.center,
                          child: Image.network(
                            widget.foodItem.imgurl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
