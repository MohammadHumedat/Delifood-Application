import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widget/favorite_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: food.where((foodItem) => foodItem.isFavorite == true).length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8),
          child: FavoriteItem(
            foodItem: food
                .where((foodItem) => foodItem.isFavorite == true)
                .toList()[index],
          ),
        ),
      ),
    );
  }
}
// Padding(
//       padding: const EdgeInsets.all(17.0),
//       child: SingleChildScrollView(
//         child: Column(
//           children:
//               food.food
//                .where((foodItem) => foodItem.isFavorite == true).map((foodItem) => FavoriteItem(foodItem: foodItem)).toList(),
//         ),
//       ),
//     );