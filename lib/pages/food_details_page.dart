import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widget/food_details/property_item.dart';
import 'package:food_delivery/widget/food_details/top_banner.dart';

class FoodDetailsPage extends StatelessWidget {
  final FoodItem foodItem;
  const FoodDetailsPage({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    // double sizeFactor = MediaQuery.of(context).size.height / 100;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBanner(foodItem: foodItem),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name, // Display the food item name
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 6.0),
                  Text('Buffalo Burger',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 37.0),
                  const IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PropertyItem(
                            propertyName: 'Size:', propertyValue: 'Medium'),
                        VerticalDivider(
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        PropertyItem(
                            propertyName: 'Calories: ',
                            propertyValue: '150 kcal'),
                        VerticalDivider(
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                        PropertyItem(
                            propertyName: 'Cooking: ',
                            propertyValue: '10-15 Min'),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                      """ lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson, lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson lorem ipson""",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color.fromARGB(255, 136, 136, 136))),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text('\$ ${foodItem.price}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                              )),
                      SizedBox(width: size.width * 0.19),
                      Expanded(
                        child: SizedBox(
                          height: size.height * 0.05,
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text('Checkout')),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
