// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:food_delivery/models/food_item.dart';

class FoodGridItem extends StatefulWidget {
  final int foodIndex;
  const FoodGridItem({super.key, required this.foodIndex});

  @override
  State<FoodGridItem> createState() => _FoodGridItemState();
}

class _FoodGridItemState extends State<FoodGridItem> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaler;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromARGB(255, 241, 237, 237),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Image.network(
                    food[widget.foodIndex].imgurl,
                    fit: BoxFit.contain,
                    height: constraints.maxHeight * 0.45,
                    alignment: Alignment.center,
                    width: constraints.maxWidth * 0.9,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback for image loading errors
                      return Container(
                        // Display a placeholder when the image fails to load
                        height: constraints.maxHeight * 0.45,
                        width: constraints.maxWidth * 0.9,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Text(
                            'Image not available',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: constraints.maxHeight * 0.2,
                    width: constraints.maxWidth * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white.withOpacity(0.0),
                      backgroundBlendMode: BlendMode
                          .darken, // To make the icon blend with the background
                    ),
                    child: InkWell(
                      onTap: () => setState(() {
                        food[widget.foodIndex] = food[widget.foodIndex]
                            .copywith(
                                isFavorite: !food[widget.foodIndex].isFavorite);
                      }),
                      child: Icon(
                        food[widget.foodIndex].isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.deepOrange,
                        size: textScale.scale(23), // Use textScaler for scaling
                        semanticLabel: food[widget.foodIndex]
                                .isFavorite // ternary operator for accessibility
                            ? 'Remove from favorites'
                            : 'Add to favorites', // Accessibility label for screen readers
                        textDirection:
                            TextDirection.ltr, // Ensure correct text direction
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: constraints.maxHeight * 0.06,
            ),
            SizedBox(
              // Use SizedBox to control the height of the text container
              height: constraints.maxHeight * 0.17,
              child: FittedBox(
                // Use FittedBox to scale text
                child: Text(
                  food[widget.foodIndex].name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.01,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.16,
              child: FittedBox(
                child: Text('\$ ${food[widget.foodIndex].price}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.deepOrange,
                          fontFamily: 'OpenSans',
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
