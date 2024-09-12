import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodGridItem extends StatelessWidget {
  final FoodItem foodItem;

  const FoodGridItem({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromARGB(255, 241, 237, 237),
      ),
      child: Column(
        children: [
          Image.network(
            foodItem.imgurl,
            fit: BoxFit.cover,
            scale: 4,
            alignment: Alignment.center,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            foodItem.name,
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            '\$ ${foodItem.price}',
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 176, 111, 14),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
