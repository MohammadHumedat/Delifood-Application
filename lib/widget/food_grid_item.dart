import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    final size = MediaQuery.of(context).size;
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
                Image.network(
                  food[widget.foodIndex].imgurl,
                  fit: BoxFit.contain,
                  height: constraints.maxHeight * 0.45,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: constraints.minHeight * 0.17,
                    width: constraints.maxWidth * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 240, 237, 237),
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
              height: constraints.maxHeight * 0.17,
              child: FittedBox(
                child: Text(
                  food[widget.foodIndex].name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.02,
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
