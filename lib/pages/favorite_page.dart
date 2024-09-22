import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteItems =
        food.where((foodItem) => foodItem.isFavorite == true).toList();
    if (favoriteItems.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/empty_state.png',
              fit: BoxFit.cover,
            ),
            Text(
              "There is no  favorite food yet",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) => Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network(
                  favoriteItems[index].imgurl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(favoriteItems[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('\$ ${favoriteItems[index].price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final targeteditem = favoriteItems[index];
                    int targetedIndex = food.indexOf(targeteditem);
                    setState(() {
                      food[targetedIndex] =
                          food[targetedIndex].copywith(isFavorite: false);
                      favoriteItems.remove(targetedIndex);
                    });
                  },
                  icon: const Icon(Icons.favorite),
                  color: Colors.deepOrange,
                )
              ],
            ),
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