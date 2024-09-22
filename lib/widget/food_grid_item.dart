import 'package:flutter/material.dart';
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
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.network(
                food[widget.foodIndex].imgurl,
                fit: BoxFit.contain,
                height: size.height * 0.1,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 240, 237, 237),
                  ),
                  child: InkWell(
                    onTap: () => setState(() {
                      food[widget.foodIndex] = food[widget.foodIndex].copywith(
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
          const SizedBox(
            height: 7,
          ),
          Text(
            food[widget.foodIndex].name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 3,
          ),
          Text('\$ ${food[widget.foodIndex].price}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.deepOrange,
                    fontFamily: 'OpenSans',
                  )),
        ],
      ),
    );
  }
}
