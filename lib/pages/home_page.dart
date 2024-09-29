import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widget/food_grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextScale = MediaQuery.of(context).textScaler;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.asset(
                'assets/images/classic_burger.jpg',
                height: size.height * 0.23,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: food.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //the number of elements in Row
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
