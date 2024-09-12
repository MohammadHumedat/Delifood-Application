import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widget/favorite_item.dart';
import 'package:food_delivery/widget/food_grid_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: SingleChildScrollView(
        child: Column(
          children:
              food.map((foodItem) => FavoriteItem(foodItem: foodItem)).toList(),
        ),
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: ListView.builder(
    //       itemCount: food.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return FoodGridItem(
    //             foodItem: FoodItem(
    //                 name: food[index].name,
    //                 imgurl: food[index].imgurl,
    //                 price: food[index].price));
    //       }),
    // );
  }
}
