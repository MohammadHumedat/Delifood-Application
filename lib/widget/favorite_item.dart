import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoriteItem extends StatelessWidget {
  final FoodItem foodItem;
  const FavoriteItem({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              foodItem.imgurl,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$ ${foodItem.price}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.deepOrange),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.favorite,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
