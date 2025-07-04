import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class TopBanner extends StatelessWidget {
  final FoodItem foodItem;

  const TopBanner({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DecoratedBox(
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
                            iconSize: 30,
                            backgroundColor:
                                const Color.fromARGB(255, 230, 227, 226),
                            iconColor: Colors.deepOrangeAccent),
                        onPressed: () {},
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.deepOrange,

                          // Ensure correct text direction
                        ),
                      ),
                    ],
                  ),
                  Align(
                    // Align the image to the center
                    heightFactor: size.height * 0.0014,
                    alignment: Alignment.center,
                    child: Image.network(
                      foodItem.imgurl,
                      fit: BoxFit.contain,
                      height: size.height * 0.23,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
